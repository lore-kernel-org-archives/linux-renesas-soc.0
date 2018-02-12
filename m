Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-lf0-f50.google.com ([209.85.215.50]:46617 "EHLO
        mail-lf0-f50.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751738AbeBLUMv (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 12 Feb 2018 15:12:51 -0500
Received: by mail-lf0-f50.google.com with SMTP id q194so22070988lfe.13
        for <linux-renesas-soc@vger.kernel.org>; Mon, 12 Feb 2018 12:12:50 -0800 (PST)
Date: Mon, 12 Feb 2018 21:12:48 +0100
From: Niklas =?iso-8859-1?Q?S=F6derlund?=
        <niklas.soderlund@ragnatech.se>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: linux-renesas-soc@vger.kernel.org
Subject: Warning for possible circular locking dependecy on v4.16-rc1
Message-ID: <20180212201248.GH7666@bigcity.dyn.berto.se>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hi Geert,

When doing some testing on v4.16-rc1 I ran across this warning a couple 
of times. I was using the renesas_config from the current master branch 
of renesas-drivers at the time. It do not hit every time but in my 
limited testing I would say ~50%.


[    2.634819] ======================================================
[    2.640996] WARNING: possible circular locking dependency detected
[    2.647176] 4.16.0-rc1-arm64-renesas-00001-g75fb1624ab1a0c5a #34 Not tainted
[    2.654222] ------------------------------------------------------
[    2.660400] swapper/0/1 is trying to acquire lock:
[    2.665188]  (prepare_lock){+.+.}, at: [<        (ptrval)>] clk_prepare_lock+0x48/0xa8
[    2.673123] 
[    2.673123] but task is already holding lock:
[    2.678953]  (of_clk_mutex){+.+.}, at: [<        (ptrval)>] __of_clk_get_from_provider.part.22+0x3c/0x120
[    2.688528] 
[    2.688528] which lock already depends on the new lock.
[    2.688528] 
[    2.696706] 
[    2.696706] the existing dependency chain (in reverse order) is:
[    2.704186] 
[    2.704186] -> #5 (of_clk_mutex){+.+.}:
[    2.709511]        __mutex_lock+0x70/0x888
[    2.713606]        mutex_lock_nested+0x1c/0x28
[    2.718049]        __of_clk_get_from_provider.part.22+0x3c/0x120
[    2.724054]        of_clk_get_from_provider+0x20/0x30
[    2.729105]        cpg_mssr_attach_dev+0xfc/0x1e0
[    2.733809]        genpd_add_device+0xbc/0x230
[    2.738251]        genpd_dev_pm_attach+0xac/0x230
[    2.742954]        dev_pm_domain_attach+0xc/0x18
[    2.747571]        platform_drv_probe+0x38/0xb8
[    2.752100]        driver_probe_device+0x23c/0x310
[    2.756890]        __driver_attach+0xc4/0xc8
[    2.761157]        bus_for_each_dev+0x74/0xc8
[    2.765511]        driver_attach+0x20/0x28
[    2.769605]        bus_add_driver+0x1b0/0x220
[    2.773960]        driver_register+0x60/0xf8
[    2.778228]        __platform_driver_register+0x40/0x48
[    2.783456]        sh_mobile_i2c_adap_init+0x18/0x20
[    2.788423]        do_one_initcall+0x9c/0x14c
[    2.792778]        kernel_init_freeable+0x1dc/0x274
[    2.797654]        kernel_init+0x10/0x100
[    2.801665]        ret_from_fork+0x10/0x18
[    2.805757] 
[    2.805757] -> #4 (&genpd->mlock){+.+.}:
[    2.811162]        __mutex_lock+0x70/0x888
[    2.815256]        mutex_lock_nested+0x1c/0x28
[    2.819699]        genpd_lock_mtx+0x14/0x20
[    2.823879]        genpd_runtime_resume+0x70/0x230
[    2.828667]        __rpm_callback+0xe0/0x268
[    2.832934]        rpm_callback+0x20/0x80
[    2.836940]        rpm_resume+0x344/0x608
[    2.840946]        __pm_runtime_resume+0x50/0x78
[    2.845561]        usb_dmac_alloc_chan_resources+0x8c/0xa0
[    2.851044]        dma_chan_get+0x28/0x80
[    2.855051]        find_candidate+0xf8/0x188
[    2.859319]        __dma_request_channel+0x68/0xc8
[    2.864108]        usb_dmac_of_xlate+0x64/0x98
[    2.868550]        of_dma_request_slave_channel+0x170/0x270
[    2.874121]        dma_request_chan+0x38/0x1d0
[    2.878568]        usbhsf_dma_init.isra.8+0x60/0x108
[    2.883531]        usbhs_fifo_probe+0x70/0x148
[    2.887972]        usbhs_probe+0x2c8/0x5e0
[    2.892065]        platform_drv_probe+0x58/0xb8
[    2.896594]        driver_probe_device+0x23c/0x310
[    2.901382]        __driver_attach+0xc4/0xc8
[    2.905649]        bus_for_each_dev+0x74/0xc8
[    2.910004]        driver_attach+0x20/0x28
[    2.914097]        bus_add_driver+0x1b0/0x220
[    2.918452]        driver_register+0x60/0xf8
[    2.922718]        __platform_driver_register+0x40/0x48
[    2.927942]        renesas_usbhs_driver_init+0x18/0x20
[    2.933078]        do_one_initcall+0x9c/0x14c
[    2.937433]        kernel_init_freeable+0x1dc/0x274
[    2.942309]        kernel_init+0x10/0x100
[    2.946316]        ret_from_fork+0x10/0x18
[    2.950407] 
[    2.950407] -> #3 (dma_list_mutex){+.+.}:
[    2.955900]        __mutex_lock+0x70/0x888
[    2.959994]        mutex_lock_nested+0x1c/0x28
[    2.964435]        __dma_request_channel+0x38/0xc8
[    2.969225]        usb_dmac_of_xlate+0x64/0x98
[    2.973666]        of_dma_request_slave_channel+0x170/0x270
[    2.979236]        dma_request_chan+0x38/0x1d0
[    2.983678]        usbhsf_dma_init.isra.8+0x60/0x108
[    2.988640]        usbhs_fifo_probe+0x70/0x148
[    2.993081]        usbhs_probe+0x2c8/0x5e0
[    2.997174]        platform_drv_probe+0x58/0xb8
[    3.001702]        driver_probe_device+0x23c/0x310
[    3.006491]        __driver_attach+0xc4/0xc8
[    3.010759]        bus_for_each_dev+0x74/0xc8
[    3.015114]        driver_attach+0x20/0x28
[    3.019208]        bus_add_driver+0x1b0/0x220
[    3.023562]        driver_register+0x60/0xf8
[    3.027829]        __platform_driver_register+0x40/0x48
[    3.033052]        renesas_usbhs_driver_init+0x18/0x20
[    3.038188]        do_one_initcall+0x9c/0x14c
[    3.042543]        kernel_init_freeable+0x1dc/0x274
[    3.047419]        kernel_init+0x10/0x100
[    3.051426]        ret_from_fork+0x10/0x18
[    3.055517] 
[    3.055517] -> #2 (of_dma_lock){+.+.}:
[    3.060749]        __mutex_lock+0x70/0x888
[    3.064843]        mutex_lock_nested+0x1c/0x28
[    3.069284]        of_dma_request_slave_channel+0x12c/0x270
[    3.074855]        dma_request_chan+0x38/0x1d0
[    3.079300]        rcar_i2c_master_xfer+0x1b4/0x458
[    3.084176]        __i2c_transfer+0x11c/0x260
[    3.088530]        i2c_transfer+0x60/0xc8
[    3.092537]        i2c_smbus_xfer_emulated+0x14c/0x5d0
[    3.097673]        i2c_smbus_xfer+0x128/0x1a0
[    3.102027]        i2c_smbus_read_byte_data+0x40/0x70
[    3.107076]        cs2000_bset.isra.1+0x2c/0x68
[    3.111604]        __cs2000_set_rate.constprop.7+0x80/0x148
[    3.117174]        cs2000_probe+0xd4/0x260
[    3.121267]        i2c_device_probe+0x2a4/0x2c8
[    3.125796]        driver_probe_device+0x23c/0x310
[    3.130584]        __device_attach_driver+0x94/0xd8
[    3.135460]        bus_for_each_drv+0x68/0xd0
[    3.139813]        __device_attach+0xd8/0x138
[    3.144168]        device_initial_probe+0x10/0x18
[    3.148870]        bus_probe_device+0x94/0xa0
[    3.153224]        device_add+0x3b8/0x5e0
[    3.157230]        device_register+0x1c/0x28
[    3.161497]        i2c_new_device+0x138/0x338
[    3.165852]        of_i2c_register_device+0x114/0x1e8
[    3.170900]        of_i2c_register_devices+0x7c/0xf8
[    3.175862]        i2c_register_adapter+0x160/0x418
[    3.180737]        __i2c_add_numbered_adapter+0x60/0x98
[    3.185959]        i2c_add_adapter+0xa4/0xd0
[    3.190227]        i2c_add_numbered_adapter+0x24/0x30
[    3.195276]        rcar_i2c_probe+0x330/0x418
[    3.199629]        platform_drv_probe+0x58/0xb8
[    3.204157]        driver_probe_device+0x23c/0x310
[    3.208946]        __driver_attach+0xc4/0xc8
[    3.213213]        bus_for_each_dev+0x74/0xc8
[    3.217567]        driver_attach+0x20/0x28
[    3.221661]        bus_add_driver+0x1b0/0x220
[    3.226015]        driver_register+0x60/0xf8
[    3.230282]        __platform_driver_register+0x40/0x48
[    3.235505]        rcar_i2c_driver_init+0x18/0x20
[    3.240207]        do_one_initcall+0x9c/0x14c
[    3.244561]        kernel_init_freeable+0x1dc/0x274
[    3.249437]        kernel_init+0x10/0x100
[    3.253444]        ret_from_fork+0x10/0x18
[    3.257536] 
[    3.257536] -> #1 (i2c_register_adapter){+.+.}:
[    3.263549]        rt_mutex_lock+0x30/0x50
[    3.267642]        i2c_adapter_lock_bus+0x10/0x18
[    3.272343]        i2c_transfer+0xa8/0xc8
[    3.276350]        i2c_smbus_xfer_emulated+0x14c/0x5d0
[    3.281486]        i2c_smbus_xfer+0x128/0x1a0
[    3.285840]        i2c_smbus_read_byte_data+0x40/0x70
[    3.290889]        cs2000_recalc_rate+0x38/0x90
[    3.295417]        clk_register+0x390/0x6e0
[    3.299598]        clk_hw_register+0xc/0x20
[    3.303778]        cs2000_probe+0x134/0x260
[    3.307957]        i2c_device_probe+0x2a4/0x2c8
[    3.312485]        driver_probe_device+0x23c/0x310
[    3.317274]        __device_attach_driver+0x94/0xd8
[    3.322150]        bus_for_each_drv+0x68/0xd0
[    3.326504]        __device_attach+0xd8/0x138
[    3.330858]        device_initial_probe+0x10/0x18
[    3.335560]        bus_probe_device+0x94/0xa0
[    3.339913]        device_add+0x3b8/0x5e0
[    3.343919]        device_register+0x1c/0x28
[    3.348186]        i2c_new_device+0x138/0x338
[    3.352540]        of_i2c_register_device+0x114/0x1e8
[    3.357589]        of_i2c_register_devices+0x7c/0xf8
[    3.362551]        i2c_register_adapter+0x160/0x418
[    3.367426]        __i2c_add_numbered_adapter+0x60/0x98
[    3.372648]        i2c_add_adapter+0xa4/0xd0
[    3.376915]        i2c_add_numbered_adapter+0x24/0x30
[    3.381964]        rcar_i2c_probe+0x330/0x418
[    3.386318]        platform_drv_probe+0x58/0xb8
[    3.390846]        driver_probe_device+0x23c/0x310
[    3.395634]        __driver_attach+0xc4/0xc8
[    3.399902]        bus_for_each_dev+0x74/0xc8
[    3.404256]        driver_attach+0x20/0x28
[    3.408350]        bus_add_driver+0x1b0/0x220
[    3.412704]        driver_register+0x60/0xf8
[    3.416971]        __platform_driver_register+0x40/0x48
[    3.422194]        rcar_i2c_driver_init+0x18/0x20
[    3.426896]        do_one_initcall+0x9c/0x14c
[    3.431250]        kernel_init_freeable+0x1dc/0x274
[    3.436126]        kernel_init+0x10/0x100
[    3.440132]        ret_from_fork+0x10/0x18
[    3.444224] 
[    3.444224] -> #0 (prepare_lock){+.+.}:
[    3.449544]        lock_acquire+0x48/0x68
[    3.453551]        __mutex_lock+0x70/0x888
[    3.457645]        mutex_lock_nested+0x1c/0x28
[    3.462086]        clk_prepare_lock+0x48/0xa8
[    3.466440]        __clk_create_clk.part.20+0x64/0xa0
[    3.471489]        __of_clk_get_from_provider.part.22+0xd0/0x120
[    3.477494]        __of_clk_get_from_provider+0x10/0x20
[    3.482717]        __of_clk_get_by_name+0x9c/0x158
[    3.487505]        clk_get+0x2c/0x78
[    3.491078]        devm_clk_get+0x4c/0xa8
[    3.495090]        rsnd_dvc_probe+0x15c/0x210
[    3.499444]        rsnd_probe+0xcc/0x480
[    3.503363]        platform_drv_probe+0x58/0xb8
[    3.507891]        driver_probe_device+0x23c/0x310
[    3.512680]        __driver_attach+0xc4/0xc8
[    3.516947]        bus_for_each_dev+0x74/0xc8
[    3.521301]        driver_attach+0x20/0x28
[    3.525395]        bus_add_driver+0x1b0/0x220
[    3.529749]        driver_register+0x60/0xf8
[    3.534016]        __platform_driver_register+0x40/0x48
[    3.539240]        rsnd_driver_init+0x18/0x20
[    3.543595]        do_one_initcall+0x9c/0x14c
[    3.547949]        kernel_init_freeable+0x1dc/0x274
[    3.552825]        kernel_init+0x10/0x100
[    3.556832]        ret_from_fork+0x10/0x18
[    3.560924] 
[    3.560924] other info that might help us debug this:
[    3.560924] 
[    3.568928] Chain exists of:
[    3.568928]   prepare_lock --> &genpd->mlock --> of_clk_mutex
[    3.568928] 
[    3.579026]  Possible unsafe locking scenario:
[    3.579026] 
[    3.584943]        CPU0                    CPU1
[    3.589469]        ----                    ----
[    3.593995]   lock(of_clk_mutex);
[    3.597309]                                lock(&genpd->mlock);
[    3.603228]                                lock(of_clk_mutex);
[    3.609060]   lock(prepare_lock);
[    3.612374] 
[    3.612374]  *** DEADLOCK ***
[    3.612374] 
[    3.618294] 3 locks held by swapper/0/1:
[    3.622212]  #0:  (&dev->mutex){....}, at: [<        (ptrval)>] __driver_attach+0x4c/0xc8
[    3.630397]  #1:  (&dev->mutex){....}, at: [<        (ptrval)>] __driver_attach+0x5c/0xc8
[    3.638581]  #2:  (of_clk_mutex){+.+.}, at: [<        (ptrval)>] __of_clk_get_from_provider.part.22+0x3c/0x120
[    3.648589] 
[    3.648589] stack backtrace:
[    3.652946] CPU: 0 PID: 1 Comm: swapper/0 Not tainted 4.16.0-rc1-arm64-renesas-00001-g75fb1624ab1a0c5a #34
[    3.662599] Hardware name: Renesas Salvator-X 2nd version board based on r8a7795 ES2.0+ (DT)
[    3.671036] Call trace:
[    3.673481]  dump_backtrace+0x0/0x1c8
[    3.677142]  show_stack+0x14/0x20
[    3.680455]  dump_stack+0xbc/0xf8
[    3.683767]  print_circular_bug.isra.19+0x1d4/0x2e0
[    3.688642]  __lock_acquire+0x15ec/0x1890
[    3.692648]  lock_acquire+0x48/0x68
[    3.696134]  __mutex_lock+0x70/0x888
[    3.699707]  mutex_lock_nested+0x1c/0x28
[    3.703626]  clk_prepare_lock+0x48/0xa8
[    3.707459]  __clk_create_clk.part.20+0x64/0xa0
[    3.711987]  __of_clk_get_from_provider.part.22+0xd0/0x120
[    3.717471]  __of_clk_get_from_provider+0x10/0x20
[    3.722172]  __of_clk_get_by_name+0x9c/0x158
[    3.726439]  clk_get+0x2c/0x78
[    3.729490]  devm_clk_get+0x4c/0xa8
[    3.732976]  rsnd_dvc_probe+0x15c/0x210
[    3.736808]  rsnd_probe+0xcc/0x480
[    3.740207]  platform_drv_probe+0x58/0xb8
[    3.744213]  driver_probe_device+0x23c/0x310
[    3.748481]  __driver_attach+0xc4/0xc8
[    3.752227]  bus_for_each_dev+0x74/0xc8
[    3.756061]  driver_attach+0x20/0x28
[    3.759633]  bus_add_driver+0x1b0/0x220
[    3.763466]  driver_register+0x60/0xf8
[    3.767212]  __platform_driver_register+0x40/0x48
[    3.771913]  rsnd_driver_init+0x18/0x20
[    3.775747]  do_one_initcall+0x9c/0x14c
[    3.779580]  kernel_init_freeable+0x1dc/0x274
[    3.783934]  kernel_init+0x10/0x100
[    3.787419]  ret_from_fork+0x10/0x18

-- 
Regards,
Niklas S�derlund
