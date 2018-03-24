Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-lf0-f48.google.com ([209.85.215.48]:34872 "EHLO
        mail-lf0-f48.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1753021AbeCXUQB (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Sat, 24 Mar 2018 16:16:01 -0400
Received: by mail-lf0-f48.google.com with SMTP id t132-v6so22900247lfe.2
        for <linux-renesas-soc@vger.kernel.org>; Sat, 24 Mar 2018 13:16:01 -0700 (PDT)
Subject: Re: [PATCH 4/5] sh_eth: add sh_eth_cpu_data::no_tx_cntr flag
From: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
To: netdev@vger.kernel.org
Cc: linux-renesas-soc@vger.kernel.org, linux-sh@vger.kernel.org
References: <b3706a51-27a4-d78b-998d-9440637ac216@cogentembedded.com>
 <a6ddaada-59fa-3a38-7c69-87891bba9cad@cogentembedded.com>
Message-ID: <43918e73-6de0-fbc4-4e8e-71b353a91ac2@cogentembedded.com>
Date: Sat, 24 Mar 2018 23:15:58 +0300
MIME-Version: 1.0
In-Reply-To: <a6ddaada-59fa-3a38-7c69-87891bba9cad@cogentembedded.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-MW
Content-Transfer-Encoding: 7bit
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Should read no_tx_cntrs in the subject -- forgot tp update it when
renaming the flag...
