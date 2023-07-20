warning: The prototype GPU support implies --no-checks. This may impact debuggability. To suppress this warning, compile with --no-checks explicitly
Start
0 (cpu): diags.chpl:10: allocate xxB of domain(1,int(64),one) at 0xPREDIFFED
0 (cpu): diags.chpl:10: allocate xxB of [domain(1,int(64),one)] int(64) at 0xPREDIFFED
0 (cpu): diags.chpl:10: allocate xxB of array elements at 0xPREDIFFED
0 (cpu): diags.chpl:10: allocate xxB of _EndCount(atomic int(64),int(64)) at 0xPREDIFFED
0 (cpu): diags.chpl:10: free xxB of _EndCount(atomic int(64),int(64)) at 0xPREDIFFED
0 (gpu 0): diags.chpl:13: allocate xxB of [domain(1,int(64),one)] int(64) at 0xPREDIFFED
0 (gpu 0): diags.chpl:13: allocate xxB of array elements at 0xPREDIFFED
0 (gpu 0): diags.chpl:13: copy from host to device, 80 bytes, commid 246
0 (gpu 0): diags.chpl:14: kernel launch (block size: 512x1x1)
0 (gpu 0): diags.chpl:18: copy from device to host, 80 bytes, commid 246
0 (gpu 0): diags.chpl:18: free xxB of array elements at 0xPREDIFFED
0 (gpu 0): diags.chpl:18: free xxB of [domain(1,int(64),one)] int(64) at 0xPREDIFFED
2 2 2 2 2 2 2 2 2 2
End
GPU diagnostics:
(kernel_launch = 1, host_to_device = 1, device_to_host = 1, device_to_device = 0)
GPU diagnostics after reset:
(kernel_launch = 0, host_to_device = 0, device_to_host = 0, device_to_device = 0)
