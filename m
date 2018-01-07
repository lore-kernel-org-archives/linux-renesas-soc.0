Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-lf0-f43.google.com ([209.85.215.43]:44954 "EHLO
        mail-lf0-f43.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1754181AbeAGRco (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Sun, 7 Jan 2018 12:32:44 -0500
Received: by mail-lf0-f43.google.com with SMTP id g63so9831420lfl.11
        for <linux-renesas-soc@vger.kernel.org>; Sun, 07 Jan 2018 09:32:43 -0800 (PST)
From: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Subject: Kernel oops in the R-Car DU driver on the V3MSK board
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        "linux-renesas-soc@vger.kernel.org"
        <linux-renesas-soc@vger.kernel.org>
Message-ID: <a5fd23a1-eb36-51b5-137c-1640ee2ae635@cogentembedded.com>
Date: Sun, 7 Jan 2018 20:32:39 +0300
MIME-Version: 1.0
Content-Type: multipart/mixed;
 boundary="------------95EEC1E70C4A0D098F3A3021"
Content-Language: en-MW
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

This is a multi-part message in MIME format.
--------------95EEC1E70C4A0D098F3A3021
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit

Hey Laurent!

    I've been working on the DU support on the V3M Starter Kit board -- it has 
LVDS putput connected to a transparent LVDS-toRGB-decoder and the output o 
that one connected tpo ADV7511W HDMI encoder. As suggested by you< I've 
directly connected the LVDS to ADV7511W in the deviec tree. Here's what I saw
on the kernel console then (only with lockless_register_fb=1, without which 
the kernel just hangs):

[    3.550355] rcar-du feb00000.display: no LVDS bus format reported
[    3.556955] Unable to handle kernel paging request at virtual address 
100000018 

[    3.564325] Mem abort info:
[    3.567151]   ESR = 0x96000004
[    3.570239]   Exception class = DABT (current EL), IL = 32 bits
[    3.576193]   SET = 0, FnV = 0
[    3.579264]   EA = 0, S1PTW = 0
[    3.582421] Data abort info:
[    3.585319]   ISV = 0, ISS = 0x00000004
[    3.589165]   CM = 0, WnR = 0
[    3.592172] [0000000100000018] user address but active_mm is swapper
[    3.598558] Internal error: Oops: 96000004 [#1] PREEMPT SMP
[    3.604148] Modules linked in:
[    3.607215] CPU: 0 PID: 18 Comm: kworker/0:1 Tainted: G        W        4.15.
0-rc6-dirty #718
[    3.615765] Hardware name: Renesas V3M Starter Kit board (DT)
[    3.621531] Workqueue: events deferred_probe_work_func
[    3.626689] pstate: 60000005 (nZCv daif -PAN -UAO)
[    3.631496] pc : rcar_du_encoder_enable+0x34/0x7c
[    3.636216] lr : rcar_du_encoder_enable+0x24/0x7c
[    3.640932] sp : ffff000008d234c0
[    3.644254] x29: ffff000008d234c0 x28: 0000000000000000
[    3.649586] x27: ffff80003d329500 x26: ffff0000088df900
[    3.654918] x25: ffff80003d072c00 x24: ffff0000088e05d8
[    3.660249] x23: ffff000008a69530 x22: ffff000008aa34f8
[    3.665580] x21: ffff80003dade880 x20: ffff80003d368b18
[    3.670911] x19: ffff80003d368b18 x18: 0000000000000068
[    3.676242] x17: 0000000000000004 x16: ffff000008cb0000
[    3.681573] x15: 0000000000000000 x14: 0000032600000309
[    3.686904] x13: 0000030300000326 x12: ffff80003d388018
[    3.692235] x11: 0000000000000000 x10: 0000000000000980
[    3.697566] x9 : ffff000008d232f0 x8 : ffff80003d88f5e0
[    3.702897] x7 : 0000000000000000 x6 : 0000000000000000
[    3.708227] x5 : 0000000000100000 x4 : ffff80003efcef80
[    3.713558] x3 : 0000000000000000 x2 : ffff80003efcefc0
[    3.718889] x1 : 0000000100000000 x0 : ffff80003d0e9ab8
[    3.724223] Process kworker/0:1 (pid: 18, stack limit = 0x00000000a6e10e42)
[    3.731204] Call trace:
[    3.733659]  rcar_du_encoder_enable+0x34/0x7c
[    3.738031]  drm_atomic_helper_commit_modeset_enables+0x12c/0x1b0
[    3.744145]  rcar_du_atomic_commit_tail+0x3c/0x68
[    3.748865]  commit_tail+0x44/0x78
[    3.752277]  drm_atomic_helper_commit+0x128/0x12c
[    3.756999]  drm_atomic_commit+0x58/0x70
[    3.760935]  restore_fbdev_mode_atomic+0x170/0x1e4
[    3.765740]  restore_fbdev_mode+0x2c/0x158
[    3.769851]  drm_fb_helper_restore_fbdev_mode_unlocked+0x60/0xb8
[    3.775877]  drm_fb_helper_set_par+0x2c/0x60
[    3.780161]  fbcon_init+0x47c/0x4dc
[    3.783661]  visual_init+0xb4/0x110
[    3.787160]  do_bind_con_driver+0x130/0x2e4
[    3.791356]  do_take_over_console+0x13c/0x1b0
[    3.795727]  do_fbcon_takeover+0x74/0xf8
[    3.799662]  fbcon_event_notify+0x834/0x8d4
[    3.803859]  notifier_call_chain+0x58/0x8c
[    3.807968]  __blocking_notifier_call_chain+0x44/0x74
[    3.813035]  blocking_notifier_call_chain+0x14/0x1c
[    3.817928]  fb_notifier_call_chain+0x20/0x28
[    3.822297]  register_framebuffer+0x2a0/0x33c
[    3.826669]  __drm_fb_helper_initial_config_and_unlock+0x264/0x3fc
[    3.832870]  drm_fb_helper_initial_config+0x44/0x60
[    3.837763]  drm_fbdev_cma_init_with_funcs+0x118/0x148
[    3.842918]  drm_fbdev_cma_init+0x18/0x20
[    3.846941]  rcar_du_modeset_init+0x4d0/0x5b8
[    3.851312]  rcar_du_probe+0xa0/0x12c
[    3.854985]  platform_drv_probe+0x50/0xbc
[    3.859007]  driver_probe_device+0x21c/0x308
[    3.863291]  __device_attach_driver+0x98/0xc8
[    3.867662]  bus_for_each_drv+0x54/0x94
[    3.871510]  __device_attach+0xc4/0x12c
[    3.875358]  device_initial_probe+0x10/0x18
[    3.879555]  bus_probe_device+0x90/0x98
[    3.883403]  deferred_probe_work_func+0xb0/0x150
[    3.888035]  process_one_work+0x12c/0x2a4
[    3.892057]  worker_thread+0x1f4/0x3f0
[    3.895816]  kthread+0xfc/0x128
[    3.898967]  ret_from_fork+0x10/0x18
[    3.902556] Code: f9403e60 b4000240 f9420c01 b4000201 (f9400c20)
[    3.908671] ---[ end trace 899ba95d70907099 ]---

    I think that's because rcar_du_encoder_mode_set() blindly assumes that 
'conn_state->connector' points to a 'struct rcar_du_connector' -- which is not 
so when you have some bridge attached to the LVDS encoder.
    Attached is my patch (against Linus' repo) that fixes this oops (but at 
the expense of the DU encoder code not being able to to enable/disable the 
panel). What's your thoughts on this issue and how to deal with it?

MBR, Sergei

--------------95EEC1E70C4A0D098F3A3021
Content-Type: text/x-patch;
 name="drm-rcar-du-encoder-fix.patch"
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
 filename="drm-rcar-du-encoder-fix.patch"

---
 drivers/gpu/drm/rcar-du/rcar_du_encoder.c |   20 +-------------------
 drivers/gpu/drm/rcar-du/rcar_du_encoder.h |    1 -
 2 files changed, 1 insertion(+), 20 deletions(-)

Index: linux/drivers/gpu/drm/rcar-du/rcar_du_encoder.c
===================================================================
--- linux.orig/drivers/gpu/drm/rcar-du/rcar_du_encoder.c
+++ linux/drivers/gpu/drm/rcar-du/rcar_du_encoder.c
@@ -32,11 +32,6 @@ static void rcar_du_encoder_disable(stru
 {
 	struct rcar_du_encoder *renc = to_rcar_encoder(encoder);
 
-	if (renc->connector && renc->connector->panel) {
-		drm_panel_disable(renc->connector->panel);
-		drm_panel_unprepare(renc->connector->panel);
-	}
-
 	if (renc->lvds)
 		rcar_du_lvdsenc_enable(renc->lvds, encoder->crtc, false);
 }
@@ -47,11 +42,6 @@ static void rcar_du_encoder_enable(struc
 
 	if (renc->lvds)
 		rcar_du_lvdsenc_enable(renc->lvds, encoder->crtc, true);
-
-	if (renc->connector && renc->connector->panel) {
-		drm_panel_prepare(renc->connector->panel);
-		drm_panel_enable(renc->connector->panel);
-	}
 }
 
 static int rcar_du_encoder_atomic_check(struct drm_encoder *encoder,
@@ -107,16 +97,8 @@ static void rcar_du_encoder_mode_set(str
 
 	rcar_du_crtc_route_output(crtc_state->crtc, renc->output);
 
-	if (!renc->lvds) {
-		/*
-		 * The DU driver creates connectors only for the outputs of the
-		 * internal LVDS encoders.
-		 */
-		renc->connector = NULL;
+	if (!renc->lvds)
 		return;
-	}
-
-	renc->connector = to_rcar_connector(conn_state->connector);
 
 	if (!info->num_bus_formats || !info->bus_formats) {
 		dev_err(encoder->dev->dev, "no LVDS bus format reported\n");
Index: linux/drivers/gpu/drm/rcar-du/rcar_du_encoder.h
===================================================================
--- linux.orig/drivers/gpu/drm/rcar-du/rcar_du_encoder.h
+++ linux/drivers/gpu/drm/rcar-du/rcar_du_encoder.h
@@ -24,7 +24,6 @@ struct rcar_du_lvdsenc;
 struct rcar_du_encoder {
 	struct drm_encoder base;
 	enum rcar_du_output output;
-	struct rcar_du_connector *connector;
 	struct rcar_du_lvdsenc *lvds;
 };
 

--------------95EEC1E70C4A0D098F3A3021--
