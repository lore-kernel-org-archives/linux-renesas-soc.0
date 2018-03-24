Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-lf0-f46.google.com ([209.85.215.46]:44518 "EHLO
        mail-lf0-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1753414AbeCXUE4 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Sat, 24 Mar 2018 16:04:56 -0400
Received: by mail-lf0-f46.google.com with SMTP id g203-v6so22830843lfg.11
        for <linux-renesas-soc@vger.kernel.org>; Sat, 24 Mar 2018 13:04:55 -0700 (PDT)
From: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Subject: [PATCH 0/2] sh_eth: unify the SoC feature checks
To: netdev@vger.kernel.org
Cc: linux-renesas-soc@vger.kernel.org, linux-sh@vger.kernel.org
Message-ID: <b3706a51-27a4-d78b-998d-9440637ac216@cogentembedded.com>
Date: Sat, 24 Mar 2018 23:04:53 +0300
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Language: en-MW
Content-Transfer-Encoding: 7bit
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hello!

Here's a set of 5 patches against DaveM's 'net-next.git' repo.

The Ether driver sometimes uses the bit fields in 'struct sh_eth_cpu_data'
to check which Ether registers exist in a certain SoC and sometimes it uses
sh_eth_is_{gether|rz_fast_ether}() which basically compares 2 pointers (1 of
them being constant) -- the latter is definitely not a strongest feature of
the RISC CPUs (be it SH or ARM), so I decided to get rid of this type of
the feature checks in favour of the bit fields (I've also made use of a
32-bit value and method pointer where appropriate)...

[1/5] sh_eth: add sh_eth_cpu_data::soft_reset() method
[2/5] sh_eth: add sh_eth_cpu_data::edtrr_trns value
[3/5] sh_eth: add sh_eth_cpu_data::xdfar_rw flag
[4/5] sh_eth: add sh_eth_cpu_data::no_tx_cntr flag
[5/5] sh_eth: add sh_eth_cpu_data::cexcr flag

MBR, Sergei
