Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-eopbgr1410104.outbound.protection.outlook.com ([40.107.141.104]:25671
        "EHLO JPN01-OS2-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1727726AbeK2AWn (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 28 Nov 2018 19:22:43 -0500
From: Biju Das <biju.das@bp.renesas.com>
To: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
        =?iso-8859-1?Q?Niklas_S=F6derlund?=
        <niklas.soderlund+renesas@ragnatech.se>,
        Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
        Jacopo Mondi <jacopo+renesas@jmondi.org>
CC: "linux-renesas-soc@vger.kernel.org"
        <linux-renesas-soc@vger.kernel.org>
Subject: Issue with enabling VSP source on rcar gen2 koelsch board
Date: Wed, 28 Nov 2018 13:20:58 +0000
Message-ID: <OSBPR01MB2103C4452BD3C3E0803CA34FB8D10@OSBPR01MB2103.jpnprd01.prod.outlook.com>
Content-Language: en-US
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hi all,

On the past, I have tested vsp source  on rcar gen2 koelsch board, using th=
e patches series below(Apart from the below  patch series, I have enabled "=
CONFIG_DRM_RCAR_VSP=3Dy")
https://git.linuxtv.org/pinchartl/media.git/log/?h=3Ddrm/du/panels

1) [HACK] ARM: shmobile: r8a7791: Link the VSP1 and DU
2) [HACK] v4l: vsp1: Disable UAPI for VSP1D
3) [HACK] drm: rcar-du: Enable VSP source support for R8A7791

But on the latest renesas-dev branch looks like  it is broken

The issue is kernel doesn't boot, if I connect display panel.  Looks like i=
t is hanging in register_framebuffer.

[    5.344412] [drm] Supports vblank timestamp caching Rev 2 (21.10.2013).
[    5.364250] [drm] No driver support for vblank timestamp query.

Have any one noticed this issue?

Regards,
Biju



Renesas Electronics Europe Ltd, Dukes Meadow, Millboard Road, Bourne End, B=
uckinghamshire, SL8 5FH, UK. Registered in England & Wales under Registered=
 No. 04586709.
