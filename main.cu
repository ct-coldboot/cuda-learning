/****
 * main.cu
 *
 * Classic hello world with CUDA flavor
 **/

#include <iostream>
#include <cuda_runtime.h>

int main() {
    int deviceCount = 0;
    cudaError_t err = cudaGetDeviceCount(&deviceCount);

    if (err != cudaSuccess) {
        std::cerr << "CUDA Error: " << cudaGetErrorString(err) << std::endl;
        return 1;
    }

    if (deviceCount == 0) {
        std::cout << "No CUDA-enabled devices found." << std::endl;
    } else {
        std::cout << "Found " << deviceCount << " CUDA device(s)." << std::endl;
        
        cudaDeviceProp prop;
        cudaGetDeviceProperties(&prop, 0); // Get properties for device 0

        std::cout << "Device 0: " << prop.name << std::endl;
        std::cout << "Compute Capability: " << prop.major << "." << prop.minor << std::endl;
    }

    return 0;
}