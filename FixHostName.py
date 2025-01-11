# Author: sujitp81@hotmail.com TKM CSE2002 batch (R98)
# This script is used to give a unique hostname to the workstation based on the
# installed GPU's UUID. All workstations need a unique hostname for remote metrics monitoring
# to function properly.
import subprocess

host_name_prefix = "TKM-RTX4090-"
lookup_map = {"GPU-25ed8ebc-e8ed-b51d-1e2d-133503dff331": "R98",
              "GPU-e1b79a0d-7026-ac02-15ac-ffcb3b20bb00": "R97",
              "GPU-6ceaec6b-c503-e19a-dd15-61e41adc7709": "R04",
              "GPU-ca665d53-95e4-f815-8063-4e953284c45b": "M01",
              "GPU-58d7bf6b-6e26-8e0c-485f-6802b8f72262": "M02",
              "GPU-b968a095-3453-338f-92c9-4b47e220b9a6": "M03",
              "GPU-9d9358c5-c1b7-7e64-860e-d685a93aedc0": "M04",
              "GPU-4c89a937-3602-c853-7560-77ababdb0b61": "M05",
              "GPU-99a0c6ec-d199-6ad2-dc23-2ee2ef307c47": "Proto"}

def fix_hostname():
    result_smi = subprocess.run(['nvidia-smi', '--query-gpu=gpu_uuid', '--format=csv,noheader'], capture_output=True,
                                text=True)

    gpu_uuid = result_smi.stdout.strip()
    print("GPU UUID: " + gpu_uuid)
    uuid_suffix = gpu_uuid.split('-')[1]

    result = subprocess.run(['hostname'], capture_output=True, text=True)
    current_hostname = result.stdout.strip()
    print("Current host name: " + current_hostname)
    new_host_name = f"{host_name_prefix}{lookup_map[gpu_uuid]}" if gpu_uuid in lookup_map else f"{host_name_prefix}{uuid_suffix}"
    print("New host name: " + new_host_name)

    if current_hostname != new_host_name:
        print(f"This machine is going to be renamed to {new_host_name}")
        result_fix = subprocess.run(['hostnamectl', 'set-hostname', new_host_name],
                                    capture_output=True,
                                    text=True)

if __name__ == '__main__':
    fix_hostname()
