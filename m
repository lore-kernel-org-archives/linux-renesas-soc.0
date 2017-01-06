Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-lf0-f50.google.com ([209.85.215.50]:35347 "EHLO
        mail-lf0-f50.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1750806AbdAFVBo (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 6 Jan 2017 16:01:44 -0500
Received: by mail-lf0-f50.google.com with SMTP id m78so39849886lfg.2
        for <linux-renesas-soc@vger.kernel.org>; Fri, 06 Jan 2017 13:01:43 -0800 (PST)
From: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
To: netdev@vger.kernel.org
Cc: linux-renesas-soc@vger.kernel.org
Subject: [PATCH 0/2] sh_eth: "intgelligent checksum" related cleanups
Date: Sat, 07 Jan 2017 00:01:40 +0300
Message-ID: <2397522.NNiHGddh8y@wasted.cogentembedded.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hello.

   Here's a set of 2 patches against DaveM's 'net.git' repo, as they are based
on a couple patches merged there recently; however, the patches are destined
for 'net-next.git' (once 'net.git' gets merged there next time). I'm cleaning
up the "intelligent checksum" related code (however, the driver only disables
this feature for now, theres's no proper offload supprt yet).

[1/2] sh_eth: get rid of 'sh_eth_cpu_data::shift_rd0'
[2/2] sh_eth: rename 'sh_eth_cpu_data::hw_crc'

MBR, Sergei
