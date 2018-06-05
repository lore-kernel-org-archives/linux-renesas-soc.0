Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-lf0-f49.google.com ([209.85.215.49]:33452 "EHLO
        mail-lf0-f49.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752358AbeFEUZ4 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 5 Jun 2018 16:25:56 -0400
Received: by mail-lf0-f49.google.com with SMTP id y20-v6so5640036lfy.0
        for <linux-renesas-soc@vger.kernel.org>; Tue, 05 Jun 2018 13:25:55 -0700 (PDT)
From: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Subject: [PATCH 0/2] Add R-Car V3H (R8A77980) support to the R-Car LVDS driver
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        David Airlie <airlied@linux.ie>,
        Rob Herring <robh+dt@kernel.org>,
        dri-devel@lists.freedesktop.org, linux-renesas-soc@vger.kernel.org,
        devicetree@vger.kernel.org
Cc: Mark Rutland <mark.rutland@arm.com>
Message-ID: <ef3c6b7e-98f2-7012-71c5-6693e6e48999@cogentembedded.com>
Date: Tue, 5 Jun 2018 23:25:52 +0300
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Language: en-MW
Content-Transfer-Encoding: 7bit
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hello!

Here's the set of 2 patches against the 'drm-next' branch of the 'drm.git' repo.
The purpose of these patches is to add the R-Car V3H (R8A77980) support to the
R-Car LVDS driver.

[1/2] dt-bindings: display: renesas: lvds: document R8A77980 bindings
[2/2] drm: rcar-du: lvds: add R8A77980 support

MBR, Sergei
