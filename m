Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-lf1-f54.google.com ([209.85.167.54]:45702 "EHLO
        mail-lf1-f54.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727735AbeJEDxK (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 4 Oct 2018 23:53:10 -0400
Received: by mail-lf1-f54.google.com with SMTP id m80-v6so7827638lfi.12
        for <linux-renesas-soc@vger.kernel.org>; Thu, 04 Oct 2018 13:58:07 -0700 (PDT)
From: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Subject: [PATCH 0/2] Add R8A77970 support to the Renesas R-Car thermal driver
To: Zhang Rui <rui.zhang@intel.com>,
        Eduardo Valentin <edubezval@gmail.com>,
        linux-pm@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>
Cc: linux-renesas-soc@vger.kernel.org,
        Mark Rutland <mark.rutland@arm.com>
Message-ID: <366d8e06-6164-94ff-823f-6b0d1e2d8d53@cogentembedded.com>
Date: Thu, 4 Oct 2018 23:58:04 +0300
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Language: en-MW
Content-Transfer-Encoding: 7bit
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hello!

Here's the set of 2 patches against the 'next' branch of Eduardo Valentin's
'linux-soc-thermal.git' repo. We're adding support for the R8A77970 thermal
sensor controller to the R-Car thermal driver.

[1/2] dt-bindings: thermal: rcar-thermal: document R8A77970 bindings
[2/2] thermal: rcar_thermal: add R8A77970 support

MBR, Sergei
