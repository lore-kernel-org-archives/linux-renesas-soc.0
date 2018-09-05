Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-lj1-f182.google.com ([209.85.208.182]:44075 "EHLO
        mail-lj1-f182.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727586AbeIFA7C (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 5 Sep 2018 20:59:02 -0400
Received: by mail-lj1-f182.google.com with SMTP id q127-v6so7358183ljq.11
        for <linux-renesas-soc@vger.kernel.org>; Wed, 05 Sep 2018 13:27:12 -0700 (PDT)
From: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Subject: [PATCH 0/2] Add R-Car gen3 SoC support to the CMT driver
To: Daniel Lezcano <daniel.lezcano@linaro.org>,
        Thomas Gleixner <tglx@linutronix.de>,
        Rob Herring <robh+dt@kernel.org>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>
Cc: linux-renesas-soc@vger.kernel.org, linux-sh@vger.kernel.org,
        Mark Rutland <mark.rutland@arm.com>
Message-ID: <3ce24bfe-1edb-1a92-8847-ff998ac86d16@cogentembedded.com>
Date: Wed, 5 Sep 2018 23:27:09 +0300
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Language: en-MW
Content-Transfer-Encoding: 7bit
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hello!

Here's the set of 2 patches against the 'tip.git' repo's 'timers/core' branch
plus the driver fixup for the 64-bit machines posted recently. We're adding
support for the CMT0 and CMT1 found in the R-Car gen3 SoCs.

[1/2] clocksource: sh_cmt: properly line-wrap sh_cmt_of_table[] initializer
[2/2] clocksource: sh_cmt: add R-Car gen3 support

MBR, Sergei
