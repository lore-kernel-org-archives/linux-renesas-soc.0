Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-lj1-f182.google.com ([209.85.208.182]:41253 "EHLO
        mail-lj1-f182.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726127AbeHQXVq (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 17 Aug 2018 19:21:46 -0400
Received: by mail-lj1-f182.google.com with SMTP id y17-v6so7276523ljy.8
        for <linux-renesas-soc@vger.kernel.org>; Fri, 17 Aug 2018 13:16:59 -0700 (PDT)
From: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Subject: [PATCH 0/2] Fix some typos in Renesas R-Car gen3 SDHI driver
To: Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Ulf Hansson <ulf.hansson@linaro.org>, linux-mmc@vger.kernel.org
Cc: linux-renesas-soc@vger.kernel.org
Message-ID: <0f984d54-77bc-44b2-4c4a-79a158bbc7e2@cogentembedded.com>
Date: Fri, 17 Aug 2018 23:16:56 +0300
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Language: en-MW
Content-Transfer-Encoding: 7bit
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hello!

Here's a set of 2 patches against the 'next' branch of Ulf Hannsson's 'mmc.git' repo.
They fix some typos I noticed...

[1/2] mmc: renesas_sdhi_internal_dmac: fix typo in DM_CM_DTRAN_MODE.BUS_WIDTH field name
[2/2] mmc: renesas_sdhi_internal_dmac: fix comment typo

MBR. Sergei
