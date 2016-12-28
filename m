Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-lf0-f43.google.com ([209.85.215.43]:33420 "EHLO
        mail-lf0-f43.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752004AbcL1VSp (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 28 Dec 2016 16:18:45 -0500
Received: by mail-lf0-f43.google.com with SMTP id c13so211087374lfg.0
        for <linux-renesas-soc@vger.kernel.org>; Wed, 28 Dec 2016 13:18:44 -0800 (PST)
From: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
To: laurent.pinchart@ideasonboard.com, airlied@linux.ie,
        dri-devel@lists.freedesktop.org, linux-renesas-soc@vger.kernel.org
Subject: [PATCH 0/2] Enable R8A7794 DU VSPD compositor
Date: Thu, 29 Dec 2016 00:18:40 +0300
Message-ID: <18781159.4YChoBxRU5@wasted.cogentembedded.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hello.

   Here's the set of 2 patches against the 'drm-next' branch of David Airlie's
'linux.git' repo. We're switching to the DU compositor for the DU driver on the
Renesas R8A7794 SoC.

[1/2] drm: rcar-du: support less VSPs than CRTCs
[2/2] drm: rcar-du: enable VSPD on R8A7794

MBR, Sergei
