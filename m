Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-oi0-f68.google.com ([209.85.218.68]:35783 "EHLO
        mail-oi0-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752121AbcKCQGS (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 3 Nov 2016 12:06:18 -0400
Received: by mail-oi0-f68.google.com with SMTP id v84so7413387oie.2
        for <linux-renesas-soc@vger.kernel.org>; Thu, 03 Nov 2016 09:06:18 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <20161031114625.GB1435@katana>
References: <1477491249-2976-1-git-send-email-ulrich.hecht+renesas@gmail.com> <20161031114625.GB1435@katana>
From: Ulrich Hecht <ulrich.hecht+renesas@gmail.com>
Date: Thu, 3 Nov 2016 17:06:17 +0100
Message-ID: <CAO3366yTp0NpXRCahyjbiVGT=aScUStcZ+PCskwgdmd_AKGb7Q@mail.gmail.com>
Subject: Re: [PATCH v2 0/5] r8a7796 I2C integration
To: Wolfram Sang <wsa@the-dreams.de>
Cc: Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Simon Horman <horms@verge.net.au>,
        Geert Uytterhoeven <geert@linux-m68k.org>,
        Magnus Damm <magnus.damm@gmail.com>
Content-Type: text/plain; charset=UTF-8
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On Mon, Oct 31, 2016 at 12:46 PM, Wolfram Sang <wsa@the-dreams.de> wrote:
>
>> This revision is based on renesas-devel-20161024-v4.9-rc2.  It adds the
>> Reviewed-bys and the entries for SYS-DMAC2 in the applicable I2C nodes.  I
>> have also made sure it works with 64-bit memory enabled.
>
> I'd like to test, but: can you tell me which branches are needed to test
> DMA? Or is there a complete branch available somewhere? Or could you
> update the branch of this feature which is pulled in by renesas-drivers?

Thank you. Please check branch r8a7796-dmac-v2 at
https://github.com/uli/kernel.git, that should contain everything you
need.

CU
Uli
