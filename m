Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-lf0-f67.google.com ([209.85.215.67]:37614 "EHLO
        mail-lf0-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751271AbeCaVPH (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Sat, 31 Mar 2018 17:15:07 -0400
Received: by mail-lf0-f67.google.com with SMTP id m200-v6so10569861lfm.4
        for <linux-renesas-soc@vger.kernel.org>; Sat, 31 Mar 2018 14:15:07 -0700 (PDT)
From: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Subject: [PATCH 0/2] sh_eth: remove SH_ETH_OFFSET_INVALID abuses
To: netdev@vger.kernel.org
Cc: linux-renesas-soc@vger.kernel.org, linux-sh@vger.kernel.org
Message-ID: <998029b4-9400-ebc3-51c1-623c3f72b6cc@cogentembedded.com>
Date: Sun, 1 Apr 2018 00:15:04 +0300
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Language: en-MW
Content-Transfer-Encoding: 7bit
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hello!

Here's a set of 2 patches against DaveM's 'net-next.git' repo. They get rid of
the abuse of SH_ETH_OFFSET_INVALID for the register existence checks, so that
only its necessary uses would remain...

[1/2] sh_eth: add sh_eth_cpu_data::no_xdfar flag
[2/2] sh_eth: kill useless check in __sh_eth_get_regs()

MBR, Sergei
