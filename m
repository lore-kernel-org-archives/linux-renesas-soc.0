Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-lf0-f52.google.com ([209.85.215.52]:34596 "EHLO
        mail-lf0-f52.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1755718AbcH1SbF (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Sun, 28 Aug 2016 14:31:05 -0400
Received: by mail-lf0-f52.google.com with SMTP id l89so87296304lfi.1
        for <linux-renesas-soc@vger.kernel.org>; Sun, 28 Aug 2016 11:31:04 -0700 (PDT)
Subject: Re: [PATCH] net: ethernet: renesas: sh_eth: do not access POST
 registers if not exist
To: Chris Brandt <chris.brandt@renesas.com>,
        "David S . Miller" <davem@davemloft.net>
References: <20160826200107.20681-1-chris.brandt@renesas.com>
Cc: Simon Horman <horms+renesas@verge.net.au>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Daniel Palmer <daniel@0x0f.com>, netdev@vger.kernel.org,
        linux-renesas-soc@vger.kernel.org
From: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Message-ID: <9f2fd410-f521-4ae1-92ed-572aa84cee46@cogentembedded.com>
Date: Sun, 28 Aug 2016 21:31:01 +0300
MIME-Version: 1.0
In-Reply-To: <20160826200107.20681-1-chris.brandt@renesas.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hello.

    Oh, and I'll have to correct your language and terminology. :-/
Should be "if they don't exist" in the subject.

On 08/26/2016 11:01 PM, Chris Brandt wrote:

> The RZ/A1 has a TSU, but since it only has one Ethernet port, it does not
> have POST registers. Therefore, if you try to write to register index
> TSU_POST1 (which will be FFFF because it does not exist),

    It's not a register index which is 0xFFFF but the register offset (fetched 
from a layout table using the index).

> it will either panic or corrupt memory elsewhere.
>
> Reported-by: Daniel Palmer <daniel@0x0f.com>
> Signed-off-by: Chris Brandt <chris.brandt@renesas.com>
[...]

MBR, Sergei
