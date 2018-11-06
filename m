Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from perceval.ideasonboard.com ([213.167.242.64]:50676 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2388733AbeKFXzz (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 6 Nov 2018 18:55:55 -0500
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Cc: Simon <horms@verge.net.au>,
        Vladimir Barinov <vladimir.barinov+renesas@cogentembedded.com>,
        Magnus <magnus.damm@gmail.com>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Subject: Re: HDMI doesn't work on ULCB board
Date: Tue, 06 Nov 2018 16:30:35 +0200
Message-ID: <2572640.8aYrqOtQfk@avalon>
In-Reply-To: <87bm7svwmp.wl-kuninori.morimoto.gx@renesas.com>
References: <87bm7svwmp.wl-kuninori.morimoto.gx@renesas.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hi Morimoto-san,

On Thursday, 18 October 2018 05:12:14 EET Kuninori Morimoto wrote:
> Hi Vladimir, Laurent
> 
> I'm testing ULCB board, and I noticed that HDMI doen't work on it.
> 
> 	- Sometimes kernel panic happen (I lost log, but it said "get crc"
> something error), - Often, kernel doesn't boot with below log if I
> connected HDMI cable when booting
> 	- Monitor say "No signal" if I connected cable *after* booting
> 
> I'm using Geert's renesas-drivers-2018-10-09-v4.19-rc7 branch.
> It seems salvator HDMI is working correctly on it.
> I attached my .config

I tried to reproduce the problem, starting with drm-next which seems to work 
fine, moving to renesas-drivers-2018-10-09-v4.19-rc7 which also didn't exhibit 
any issue. I then used your kernel configuration, and got a WARN_ON \o/

[    1.805110] [drm] Supports vblank timestamp caching Rev 2 (21.10.2013).
[    1.811758] [drm] No driver support for vblank timestamp query.
[    1.878688] WARNING: CPU: 1 PID: 62 at /home/laurent/src/iob/renesas/linux/
drivers/gpu/drm/rcar-du/rcar_du_crtc.c:229 rcar_du_crtc_get+0x604/0x628
[    1.878712] CPU: 1 PID: 62 Comm: kworker/1:1 Not tainted 4.19.0-rc7 #2820
[    1.878716] Hardware name: Renesas H3ULCB Kingfisher board based on r8a7795 
ES2.0+ (DT)
[    1.878725] Workqueue: events deferred_probe_work_func
[    1.878734] pstate: 00000005 (nzcv daif -PAN -UAO)
[    1.878739] pc : rcar_du_crtc_get+0x604/0x628
[    1.878743] lr : rcar_du_crtc_get+0xa8/0x628
[    1.878747] sp : ffff00000a12b330
[    1.878750] x29: ffff00000a12b330 x28: 0000000000000000 
[    1.878759] x27: 0000000000000004 x26: ffff8006f90fc000 
[    1.878768] x25: ffff8006f9de3ad8 x24: 0000000000000001 
[    1.878776] x23: 0000000000000001 x22: 0000000006590fa0 
[    1.878784] x21: ffff8006f9026818 x20: ffff000008a6e000 
[    1.878792] x19: ffff8006f9610770 x18: 0000000000001ef4 
[    1.878799] x17: 0000000000000000 x16: ffff8006faee5900 
[    1.878807] x15: 0000000000001eeb x14: ffff0000096a9000 
[    1.878815] x13: 0000000000001ef6 x12: 0000000000001eeb 
[    1.878823] x11: ffff8006faee60e0 x10: ffff000008ab5000 
[    1.878831] x9 : ffff0000098ad000 x8 : ffff8006faee5900 
[    1.878839] x7 : ffff000008b1a000 x6 : ffff000008b1a308 
[    1.878847] x5 : 0000000000000002 x4 : 0000000000000006 
[    1.878855] x3 : ffff0000087d7670 x2 : ffff8006f9610018 
[    1.878862] x1 : 0000000000000000 x0 : ffff8006f9611cf0 
[    1.878871] Call trace:
[    1.878876]  rcar_du_crtc_get+0x604/0x628
[    1.878880]  rcar_du_crtc_atomic_begin+0x2c/0x60
[    1.878890]  drm_atomic_helper_commit_planes+0x84/0x218
[    1.878895]  rcar_du_atomic_commit_tail+0x38/0x70
[    1.878900]  commit_tail+0x4c/0x80
[    1.878904]  drm_atomic_helper_commit+0xfc/0x178
[    1.878911]  drm_atomic_commit+0x54/0x60
[    1.878918]  restore_fbdev_mode_atomic+0x180/0x1f0
[    1.878922]  restore_fbdev_mode+0x58/0x198
[    1.878927]  drm_fb_helper_restore_fbdev_mode_unlocked+0x80/0xd8
[    1.878932]  drm_fb_helper_set_par+0x34/0x68
[    1.878939]  fbcon_init+0x504/0x558
[    1.878945]  visual_init+0xa0/0xf0
[    1.878950]  do_bind_con_driver+0x160/0x338
[    1.878955]  do_take_over_console+0x128/0x1a8
[    1.878959]  do_fbcon_takeover+0x80/0x108
[    1.878964]  fbcon_event_notify+0x9ac/0x9d8
[    1.878971]  notifier_call_chain+0x5c/0x98
[    1.878975]  __blocking_notifier_call_chain+0x58/0xa0
[    1.878979]  blocking_notifier_call_chain+0x3c/0x50
[    1.878983]  fb_notifier_call_chain+0x30/0x40
[    1.878987]  register_framebuffer+0x288/0x330
[    1.878992]  __drm_fb_helper_initial_config_and_unlock+0x24c/0x410
[    1.878996]  drm_fb_helper_fbdev_setup+0xf0/0x210
[    1.879000]  drm_fbdev_cma_init+0xa4/0xf0
[    1.879005]  rcar_du_modeset_init+0x3b4/0x570
[    1.879009]  rcar_du_probe+0x134/0x210
[    1.879016]  platform_drv_probe+0x58/0xb8
[    1.879020]  really_probe+0x20c/0x2a0
[    1.879024]  driver_probe_device+0x60/0x108
[    1.879028]  __device_attach_driver+0x9c/0xe0
[    1.879031]  bus_for_each_drv+0x80/0xe0
[    1.879035]  __device_attach+0xf0/0x150
[    1.879039]  device_initial_probe+0x24/0x30
[    1.879042]  bus_probe_device+0xa0/0xa8
[    1.879046]  deferred_probe_work_func+0x78/0xb0
[    1.879052]  process_one_work+0x2c4/0x6c0
[    1.879055]  worker_thread+0x244/0x438
[    1.879060]  kthread+0x100/0x130
[    1.879067]  ret_from_fork+0x10/0x1c
[    1.879070] irq event stamp: 42150
[    1.879080] hardirqs last  enabled at (42149): [<ffff00000873feac>] 
_raw_spin_unlock_irqrestore+0x7c/0x88
[    1.879086] hardirqs last disabled at (42150): [<ffff00000808192c>] 
do_debug_exception+0x17c/0x1b8
[    1.879090] softirqs last  enabled at (41936): [<ffff00000808200c>] 
__do_softirq+0x46c/0x51c
[    1.879097] softirqs last disabled at (41915): [<ffff0000080b0914>] 
irq_exit+0x12c/0x138
[    1.879100] ---[ end trace ec07bda5b9bd7ef1 ]---

I'm now investigating it.

-- 
Regards,

Laurent Pinchart
