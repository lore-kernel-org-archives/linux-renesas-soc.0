Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from lucky1.263xmail.com ([211.157.147.134]:51479 "EHLO
        lucky1.263xmail.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752205AbeERBVj (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 17 May 2018 21:21:39 -0400
Cc: shawn.lin@rock-chips.com,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
From: Shawn Lin <shawn.lin@rock-chips.com>
Subject: rcar-du DRM driver failed to build
Message-ID: <bf0abd12-70aa-4a86-34b5-e6e94eb2f3f4@rock-chips.com>
Date: Fri, 18 May 2018 09:21:48 +0800
MIME-Version: 1.0
Content-Type: text/plain; charset=gbk; format=flowed
Content-Transfer-Encoding: 8bit
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hi,

linux-next-20180517 fail to build for arm64 defconfig due to this
drivers.


   CC [M]  drivers/gpu/drm/rcar-du/rcar_du_drv.o
   CC [M]  drivers/gpu/drm/rcar-du/rcar_du_vsp.o
   CC [M]  drivers/gpu/drm/rcar-du/rcar_du_of.o
drivers/gpu/drm/rcar-du/rcar_du_of.c:320:13: error: redefinition of 
��rcar_du_of_init��
  void __init rcar_du_of_init(const struct of_device_id *of_ids)
              ^~~~~~~~~~~~~~~
In file included from drivers/gpu/drm/rcar-du/rcar_du_of.c:21:0:
drivers/gpu/drm/rcar-du/rcar_du_of.h:17:20: note: previous definition of 
��rcar_du_of_init�� was here
  static inline void rcar_du_of_init(const struct of_device_id *of_ids) { }
                     ^~~~~~~~~~~~~~~
drivers/gpu/drm/rcar-du/rcar_du_vsp.c: In function 
��rcar_du_vsp_plane_atomic_duplicate_state��:
drivers/gpu/drm/rcar-du/rcar_du_vsp.c:325:6: error: ��struct 
rcar_du_vsp_plane_state�� has no member named ��alpha��
   copy->alpha = to_rcar_vsp_plane_state(plane->state)->alpha;
       ^~
drivers/gpu/drm/rcar-du/rcar_du_vsp.c:325:53: error: ��struct 
rcar_du_vsp_plane_state�� has no member named ��alpha��
   copy->alpha = to_rcar_vsp_plane_state(plane->state)->alpha;
                                                      ^~
make[4]: *** [drivers/gpu/drm/rcar-du/rcar_du_of.o] Error 1
make[4]: *** Waiting for unfinished jobs....
make[4]: *** [drivers/gpu/drm/rcar-du/rcar_du_vsp.o] Error 1
make[3]: *** [drivers/gpu/drm/rcar-du] Error 2
