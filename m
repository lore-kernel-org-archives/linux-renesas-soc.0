Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-lf0-f68.google.com ([209.85.215.68]:37607 "EHLO
        mail-lf0-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752955AbeARVKZ (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 18 Jan 2018 16:10:25 -0500
Received: by mail-lf0-f68.google.com with SMTP id f3so28449591lfe.4
        for <linux-renesas-soc@vger.kernel.org>; Thu, 18 Jan 2018 13:10:25 -0800 (PST)
From: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Message-Id: <20180118210557.091065338@cogentembedded.com>
Date: Fri, 19 Jan 2018 00:05:57 +0300
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: David Airlie <airlied@linux.ie>
To: Rob Herring <robh+dt@kernel.org>
To: Mark Rutland <mark.rutland@arm.com>
To: dri-devel@lists.freedesktop.org
To: linux-renesas-soc@vger.kernel.org
To: devicetree@vger.kernel.org
Cc: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Subject: [PATCH v2 0/2] Add R-Car V3M (R8A77970) support to the DU driver
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hello!

Here's the set of 2 patches against the 'drm-next' branch of David Airlie's
'linux.git' repo. The purpose of these patches is to add the R-Car V3M
(R8A77970) support to the DU driver; the LVDS driver patches will be posted
separately...

[1/2] DT: display: renesas,du: document R8A77970 bindings
[2/2] drm: rcar-du: add R8A77970 support

MBR, Sergei
