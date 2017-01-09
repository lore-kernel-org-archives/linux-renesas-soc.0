Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from relmlor1.renesas.com ([210.160.252.171]:41781 "EHLO
        relmlie4.idc.renesas.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1761005AbdAIPtT (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 9 Jan 2017 10:49:19 -0500
Received: from relmlac3.idc.renesas.com (relmlac3.idc.renesas.com [10.200.69.23])
        by relmlir1.idc.renesas.com (Postfix) with ESMTP id 4A94040253
        for <linux-renesas-soc@vger.kernel.org>; Tue, 10 Jan 2017 00:49:17 +0900 (JST)
Received: from relmlac3.idc.renesas.com (localhost [127.0.0.1])
        by relmlac3.idc.renesas.com (Postfix) with ESMTP id 2B0531806F
        for <linux-renesas-soc@vger.kernel.org>; Tue, 10 Jan 2017 00:49:17 +0900 (JST)
From: Ramesh Shanmugasundaram <ramesh.shanmugasundaram@bp.renesas.com>
To: Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Subject: Possible issue?
Date: Mon, 9 Jan 2017 15:49:14 +0000
Message-ID: <HK2PR06MB0545EE9CF1C03E0275542910C3640@HK2PR06MB0545.apcprd06.prod.outlook.com>
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Noticed (only once so far) the below issue on renesas-drivers-2016-12-27-v4=
.10-rc1 with lockdep enabled. Anybody else seen it?=20


[    2.520105]
[    2.521598] =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D
[    2.527771] [ INFO: possible circular locking dependency detected ]
[    2.534033] 4.10.0-rc1-00012-g862fa6e-dirty #19 Not tainted
[    2.539598] -------------------------------------------------------
[    2.545857] swapper/0/1 is trying to acquire lock:
[    2.550641]  (&genpd->mlock){+.+.+.}, at: [<ffff0000085bf544>] genpd_loc=
k_mtx+0x24/0x30
[    2.558654]
[    2.558654] but task is already holding lock:
[    2.564479]  (prepare_lock){+.+...}, at: [<ffff0000085021d4>] clk_prepar=
e_lock+0x2c/0xe8
[    2.572575]
[    2.572575] which lock already depends on the new lock.
[    2.572575]
[    2.580745]
[    2.580745] the existing dependency chain (in reverse order) is:
[    2.588219]
[    2.588219] -> #2 (prepare_lock){+.+...}:
[    2.593702]
[    2.593712] [<ffff00000812c7e8>] __lock_acquire+0x1608/0x1688
[    2.601539]
[    2.601544] [<ffff00000812cc44>] lock_acquire+0xcc/0x298
[    2.608937]
[    2.608945] [<ffff0000089a1120>] mutex_lock_nested+0x78/0x648
[    2.616771]
[    2.616775] [<ffff0000085021fc>] clk_prepare_lock+0x54/0xe8
[    2.624428]
[    2.624433] [<ffff0000085077bc>] __clk_create_clk.part.16+0x5c/0xb0
[    2.632780]
[    2.632784] [<ffff00000850858c>] __of_clk_get_from_provider+0x124/0x168
[    2.641479]
[    2.641483] [<ffff000008500e48>] __of_clk_get_by_name+0x108/0x120
[    2.649656]
[    2.649660] [<ffff000008500eec>] clk_get+0x3c/0x90
[    2.656532]
[    2.656535] [<ffff000008500630>] devm_clk_get+0x50/0xa8
[    2.663842]
[    2.663849] [<ffff00000885f550>] rsnd_adg_probe+0x98/0x590
[    2.671415]
[    2.671420] [<ffff00000885c0d8>] rsnd_probe+0xd8/0x5b8
[    2.678639]
[    2.678645] [<ffff0000085a6018>] platform_drv_probe+0x58/0xc0
[    2.686471]
[    2.686478] [<ffff0000085a34bc>] driver_probe_device+0x2c4/0x458
[    2.694565]
[    2.694568] [<ffff0000085a377c>] __driver_attach+0x12c/0x130
[    2.702308]
[    2.702312] [<ffff0000085a0e00>] bus_for_each_dev+0x70/0xb0
[    2.709965]
[    2.709969] [<ffff0000085a2bf8>] driver_attach+0x30/0x40
[    2.717361]
[    2.717365] [<ffff0000085a25d8>] bus_add_driver+0x250/0x2c0
[    2.725017]
[    2.725021] [<ffff0000085a4950>] driver_register+0x68/0x100
[    2.732674]
[    2.732677] [<ffff0000085a5f44>] __platform_driver_register+0x54/0x60
[    2.741198]
[    2.741207] [<ffff000008d8cecc>] rsnd_driver_init+0x18/0x20
[    2.748860]
[    2.748866] [<ffff0000080839ac>] do_one_initcall+0x44/0x138
[    2.756519]
[    2.756526] [<ffff000008d40d84>] kernel_init_freeable+0x1f8/0x298
[    2.764700]
[    2.764704] [<ffff00000899a498>] kernel_init+0x18/0x108
[    2.772010]
[    2.772013] [<ffff000008083710>] ret_from_fork+0x10/0x40
[    2.779405]
[    2.779405] -> #1 (of_clk_mutex){+.+.+.}:
[    2.784888]
[    2.784892] [<ffff00000812c7e8>] __lock_acquire+0x1608/0x1688
[    2.792719]
[    2.792722] [<ffff00000812cc44>] lock_acquire+0xcc/0x298
[    2.800115]
[    2.800119] [<ffff0000089a1120>] mutex_lock_nested+0x78/0x648
[    2.807945]
[    2.807948] [<ffff0000085084b4>] __of_clk_get_from_provider+0x4c/0x168
[    2.816557]
[    2.816560] [<ffff000008508600>] of_clk_get_from_provider+0x30/0x40
[    2.824907]
[    2.824912] [<ffff00000850f004>] cpg_mssr_attach_dev+0xcc/0x1e8
[    2.832912]
[    2.832915] [<ffff0000085bfe74>] genpd_add_device+0x104/0x228
[    2.840742]
[    2.840745] [<ffff0000085c135c>] genpd_dev_pm_attach+0xac/0x2d0
[    2.848745]
[    2.848752] [<ffff0000085aeb30>] dev_pm_domain_attach+0x20/0x30
[    2.856753]
[    2.856755] [<ffff0000085a5ffc>] platform_drv_probe+0x3c/0xc0
[    2.864582]
[    2.864586] [<ffff0000085a34bc>] driver_probe_device+0x2c4/0x458
[    2.872673]
[    2.872676] [<ffff0000085a377c>] __driver_attach+0x12c/0x130
[    2.880416]
[    2.880419] [<ffff0000085a0e00>] bus_for_each_dev+0x70/0xb0
[    2.888073]
[    2.888076] [<ffff0000085a2bf8>] driver_attach+0x30/0x40
[    2.895469]
[    2.895472] [<ffff0000085a25d8>] bus_add_driver+0x250/0x2c0
[    2.903126]
[    2.903130] [<ffff0000085a4950>] driver_register+0x68/0x100
[    2.910783]
[    2.910786] [<ffff0000085a5f44>] __platform_driver_register+0x54/0x60
[    2.919307]
[    2.919314] [<ffff000008d72b20>] rcar_gen3_phy_usb2_driver_init+0x18/0x2=
0
[    2.928182]
[    2.928185] [<ffff0000080839ac>] do_one_initcall+0x44/0x138
[    2.935838]
[    2.935841] [<ffff000008d40d84>] kernel_init_freeable+0x1f8/0x298
[    2.944015]
[    2.944019] [<ffff00000899a498>] kernel_init+0x18/0x108
[    2.951324]
[    2.951327] [<ffff000008083710>] ret_from_fork+0x10/0x40
[    2.958721]
[    2.958721] -> #0 (&genpd->mlock){+.+.+.}:
[    2.964289]
[    2.964293] [<ffff000008129778>] print_circular_bug+0x80/0x2e0
[    2.972206]
[    2.972210] [<ffff00000812c810>] __lock_acquire+0x1630/0x1688
[    2.980036]
[    2.980040] [<ffff00000812cc44>] lock_acquire+0xcc/0x298
[    2.987432]
[    2.987436] [<ffff0000089a1120>] mutex_lock_nested+0x78/0x648
[    2.995262]
[    2.995265] [<ffff0000085bf544>] genpd_lock_mtx+0x24/0x30
[    3.002744]
[    3.002747] [<ffff0000085c1b70>] genpd_runtime_resume+0xe0/0x270
[    3.010834]
[    3.010838] [<ffff0000085b20b8>] __rpm_callback+0xe8/0x260
[    3.018405]
[    3.018407] [<ffff0000085b2268>] rpm_callback+0x38/0xa8
[    3.025713]
[    3.025716] [<ffff0000085b1cdc>] rpm_resume+0x4bc/0x710
[    3.033021]
[    3.033024] [<ffff0000085b1f94>] __pm_runtime_resume+0x64/0xa0
[    3.040938]
[    3.040945] [<ffff00000875dd3c>] rcar_i2c_master_xfer+0x4c/0x4b8
[    3.049032]
[    3.049036] [<ffff0000087530f4>] __i2c_transfer+0x13c/0x9a8
[    3.056690]
[    3.056693] [<ffff0000087539cc>] i2c_transfer+0x6c/0xf8
[    3.063999]
[    3.064002] [<ffff000008753c4c>] i2c_smbus_xfer_emulated+0x11c/0x528
[    3.072436]
[    3.072439] [<ffff000008754204>] i2c_smbus_xfer+0x1ac/0x8e0
[    3.080092]
[    3.080095] [<ffff000008754b2c>] i2c_smbus_read_byte_data+0x3c/0x50
[    3.088442]
[    3.088446] [<ffff00000850c71c>] cs2000_bset.isra.1+0x34/0x60
[    3.096273]
[    3.096277] [<ffff00000850c77c>] cs2000_enable_dev_config+0x34/0x60
[    3.104624]
[    3.104628] [<ffff00000850c810>] cs2000_enable+0x28/0xd0
[    3.112020]
[    3.112023] [<ffff0000085029f0>] clk_core_prepare+0xf0/0x410
[    3.119762]
[    3.119765] [<ffff0000085031f4>] clk_prepare+0x2c/0x58
[    3.126984]
[    3.126989] [<ffff00000885f440>] rsnd_adg_clk_control+0x58/0xd0
[    3.134989]
[    3.134993] [<ffff00000885f8c8>] rsnd_adg_probe+0x410/0x590
[    3.142646]
[    3.142649] [<ffff00000885c0d8>] rsnd_probe+0xd8/0x5b8
[    3.149868]
[    3.149871] [<ffff0000085a6018>] platform_drv_probe+0x58/0xc0
[    3.157698]
[    3.157702] [<ffff0000085a34bc>] driver_probe_device+0x2c4/0x458
[    3.165790]
[    3.165793] [<ffff0000085a377c>] __driver_attach+0x12c/0x130
[    3.173533]
[    3.173536] [<ffff0000085a0e00>] bus_for_each_dev+0x70/0xb0
[    3.181189]
[    3.181193] [<ffff0000085a2bf8>] driver_attach+0x30/0x40
[    3.188585]
[    3.188588] [<ffff0000085a25d8>] bus_add_driver+0x250/0x2c0
[    3.196241]
[    3.196245] [<ffff0000085a4950>] driver_register+0x68/0x100
[    3.203898]
[    3.203901] [<ffff0000085a5f44>] __platform_driver_register+0x54/0x60
[    3.212422]
[    3.212426] [<ffff000008d8cecc>] rsnd_driver_init+0x18/0x20
[    3.220080]
[    3.220083] [<ffff0000080839ac>] do_one_initcall+0x44/0x138
[    3.227736]
[    3.227739] [<ffff000008d40d84>] kernel_init_freeable+0x1f8/0x298
[    3.235913]
[    3.235916] [<ffff00000899a498>] kernel_init+0x18/0x108
[    3.243222]
[    3.243225] [<ffff000008083710>] ret_from_fork+0x10/0x40
[    3.250618]
[    3.250618] other info that might help us debug this:
[    3.250618]
[    3.258614] Chain exists of:
[    3.258614]   &genpd->mlock --> of_clk_mutex --> prepare_lock
[    3.258614]
[    3.268701]  Possible unsafe locking scenario:
[    3.268701]
[    3.274613]        CPU0                    CPU1
[    3.279135]        ----                    ----
[    3.283656]   lock(prepare_lock);
[    3.286965]                                lock(of_clk_mutex);
[    3.292792]                                lock(prepare_lock);
[    3.298618]   lock(&genpd->mlock);
[    3.302014]
[    3.302014]  *** DEADLOCK ***
[    3.302014]
[    3.307928] 3 locks held by swapper/0/1:
[    3.311842]  #0:  (&dev->mutex){......}, at: [<ffff0000085a36d0>] __driv=
er_attach+0x80/0x130
[    3.320278]  #1:  (&dev->mutex){......}, at: [<ffff0000085a36e0>] __driv=
er_attach+0x90/0x130
[    3.328714]  #2:  (prepare_lock){+.+...}, at: [<ffff0000085021d4>] clk_p=
repare_lock+0x2c/0xe8
[    3.337237]
[    3.337237] stack backtrace:
[    3.341589] CPU: 0 PID: 1 Comm: swapper/0 Not tainted 4.10.0-rc1-00012-g=
862fa6e-dirty #19
[    3.349757] Hardware name: Renesas Salvator-X board based on r8a7795 (DT=
)
[    3.356538] Call trace:
[    3.358980] [<ffff00000808a4c0>] dump_backtrace+0x0/0x2a0
[    3.364372] [<ffff00000808a784>] show_stack+0x24/0x30
[    3.369419] [<ffff00000848daa4>] dump_stack+0xbc/0xf8
[    3.374465] [<ffff0000081298f0>] print_circular_bug+0x1f8/0x2e0
[    3.380378] [<ffff00000812c810>] __lock_acquire+0x1630/0x1688
[    3.386118] [<ffff00000812cc44>] lock_acquire+0xcc/0x298
[    3.391423] [<ffff0000089a1120>] mutex_lock_nested+0x78/0x648
[    3.397162] [<ffff0000085bf544>] genpd_lock_mtx+0x24/0x30
[    3.402553] [<ffff0000085c1b70>] genpd_runtime_resume+0xe0/0x270
[    3.408552] [<ffff0000085b20b8>] __rpm_callback+0xe8/0x260
[    3.414030] [<ffff0000085b2268>] rpm_callback+0x38/0xa8
[    3.419248] [<ffff0000085b1cdc>] rpm_resume+0x4bc/0x710
[    3.424466] [<ffff0000085b1f94>] __pm_runtime_resume+0x64/0xa0
[    3.430293] [<ffff00000875dd3c>] rcar_i2c_master_xfer+0x4c/0x4b8
[    3.436292] [<ffff0000087530f4>] __i2c_transfer+0x13c/0x9a8
[    3.441857] [<ffff0000087539cc>] i2c_transfer+0x6c/0xf8
[    3.447075] [<ffff000008753c4c>] i2c_smbus_xfer_emulated+0x11c/0x528
[    3.453422] [<ffff000008754204>] i2c_smbus_xfer+0x1ac/0x8e0
[    3.458987] [<ffff000008754b2c>] i2c_smbus_read_byte_data+0x3c/0x50
[    3.465247] [<ffff00000850c71c>] cs2000_bset.isra.1+0x34/0x60
[    3.470987] [<ffff00000850c77c>] cs2000_enable_dev_config+0x34/0x60
[    3.477246] [<ffff00000850c810>] cs2000_enable+0x28/0xd0
[    3.482550] [<ffff0000085029f0>] clk_core_prepare+0xf0/0x410
[    3.488202] [<ffff0000085031f4>] clk_prepare+0x2c/0x58
[    3.493334] [<ffff00000885f440>] rsnd_adg_clk_control+0x58/0xd0
[    3.499246] [<ffff00000885f8c8>] rsnd_adg_probe+0x410/0x590
[    3.504812] [<ffff00000885c0d8>] rsnd_probe+0xd8/0x5b8
[    3.509942] [<ffff0000085a6018>] platform_drv_probe+0x58/0xc0
[    3.515682] [<ffff0000085a34bc>] driver_probe_device+0x2c4/0x458
[    3.521681] [<ffff0000085a377c>] __driver_attach+0x12c/0x130
[    3.527333] [<ffff0000085a0e00>] bus_for_each_dev+0x70/0xb0
[    3.532899] [<ffff0000085a2bf8>] driver_attach+0x30/0x40
[    3.538203] [<ffff0000085a25d8>] bus_add_driver+0x250/0x2c0
[    3.543769] [<ffff0000085a4950>] driver_register+0x68/0x100
[    3.549333] [<ffff0000085a5f44>] __platform_driver_register+0x54/0x60
[    3.555767] [<ffff000008d8cecc>] rsnd_driver_init+0x18/0x20
[    3.561331] [<ffff0000080839ac>] do_one_initcall+0x44/0x138
[    3.566897] [<ffff000008d40d84>] kernel_init_freeable+0x1f8/0x298
[    3.572983] [<ffff00000899a498>] kernel_init+0x18/0x108
[    3.578200] [<ffff000008083710>] ret_from_fork+0x10/0x40

Thanks,
Ramesh
