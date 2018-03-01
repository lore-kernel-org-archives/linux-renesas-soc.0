Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-lf0-f65.google.com ([209.85.215.65]:39242 "EHLO
        mail-lf0-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1033627AbeCASE5 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 1 Mar 2018 13:04:57 -0500
Received: by mail-lf0-f65.google.com with SMTP id f75so9661264lfg.6
        for <linux-renesas-soc@vger.kernel.org>; Thu, 01 Mar 2018 10:04:56 -0800 (PST)
From: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Subject: [PATCH v2 0/3] Add R-Car V3M (R8A77970) support to the R-Car LVDS
 driver
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        David Airlie <airlied@linux.ie>,
        Rob Herring <robh+dt@kernel.org>,
        dri-devel@lists.freedesktop.org, linux-renesas-soc@vger.kernel.org,
        devicetree@vger.kernel.org
Cc: Mark Rutland <mark.rutland@arm.com>
Message-ID: <df9de4e7-cf72-cdb5-5111-9fd616f51509@cogentembedded.com>
Date: Thu, 1 Mar 2018 21:04:53 +0300
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Language: en-MW
Content-Transfer-Encoding: 7bit
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hello!

Here's the set of 2 patches against the 'drm-next' branch of David Airlie's
'linux.git' repo plus Laurent Picnahrt's patches creating the R-Car LVDS bridge
driver posted recently. The purpose of these patches is to add the R-Car V3M
(R8A77970) support to the R-Car LVDS driver.

[1/2] DT: display: renesas,lvds: document R8A77970 bindings
[2/2] drm: rcar-du: lvds: add R8A77970 support

MBR, Sergei
