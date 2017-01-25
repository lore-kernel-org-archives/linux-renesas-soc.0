Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-lf0-f52.google.com ([209.85.215.52]:36763 "EHLO
        mail-lf0-f52.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751803AbdAYVd6 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 25 Jan 2017 16:33:58 -0500
Received: by mail-lf0-f52.google.com with SMTP id z134so136035418lff.3
        for <linux-renesas-soc@vger.kernel.org>; Wed, 25 Jan 2017 13:33:58 -0800 (PST)
From: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
To: laurent.pinchart@ideasonboard.com, airlied@linux.ie,
        dri-devel@lists.freedesktop.org, daniel.vetter@intel.com,
        jani.nikula@linux.intel.com, seanpaul@chromium.org
Cc: linux-renesas-soc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH v3 0/3] Enable R8A7790/1 DU VSPD compositor
Date: Thu, 26 Jan 2017 00:33:55 +0300
Message-ID: <1542778.dcWpka5Jpx@wasted.cogentembedded.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hello.

   Here's the set of 3 patches against the 'drm-next' branch of David Airlie's
'linux.git' repo. This is a port of Laurent's DRM/DU live source patches to the
recent kernel, see [1] for the version 2 of the patchset (including a Laurent's
big blurb :-)). For the patch #3 to work one absolutely needs the VSP1 patch
[2] to be applied, else the kernel will just hang...

[1] https://lists.freedesktop.org/archives/dri-devel/2015-March/079319.html.
[2] https://patchwork.kernel.org/patch/9473265/

[1/3] drm: Add live source object
[2/3] drm: Connect live source to framebuffers
[3/3] drm: rcar-du: Add VSP1 live source support

MBR, Sergei
