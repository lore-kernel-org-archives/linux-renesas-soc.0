Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-lf1-f42.google.com ([209.85.167.42]:39071 "EHLO
        mail-lf1-f42.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726797AbeIMBQi (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 12 Sep 2018 21:16:38 -0400
Received: by mail-lf1-f42.google.com with SMTP id v77-v6so2817189lfa.6
        for <linux-renesas-soc@vger.kernel.org>; Wed, 12 Sep 2018 13:10:29 -0700 (PDT)
From: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Subject: [PATCH v2 0/3] Add R-Car gen3 SoC support to the CMT driver
To: Daniel Lezcano <daniel.lezcano@linaro.org>,
        Thomas Gleixner <tglx@linutronix.de>,
        Rob Herring <robh+dt@kernel.org>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>
Cc: linux-renesas-soc@vger.kernel.org, linux-sh@vger.kernel.org,
        Mark Rutland <mark.rutland@arm.com>
Message-ID: <c94a4ad6-93ee-05e4-e2c1-e8d24d3bc75e@cogentembedded.com>
Date: Wed, 12 Sep 2018 23:10:26 +0300
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Language: en-MW
Content-Transfer-Encoding: 7bit
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hello!

Here's the set of 3 patches against the 'tip.git' repo's 'timers/core' branch
plus the CMT driver fixups for the 32/64-bit machines posted recently. We're
adding support for the CMT types0/1 found in the R-Car gen3 SoCs.

[1/3] clocksource: sh_cmt: properly line-wrap sh_cmt_of_table[] initializer
[2/3] dt-bindings: timer: renesas: cmt: document R-Car gen3 support
[3/3] clocksource: sh_cmt: add R-Car gen3 support

MBR, Sergei
