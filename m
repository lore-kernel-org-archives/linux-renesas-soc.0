Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-ot0-f196.google.com ([74.125.82.196]:33264 "EHLO
        mail-ot0-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752061AbdBHLUU (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 8 Feb 2017 06:20:20 -0500
MIME-Version: 1.0
In-Reply-To: <20170208105426.GE26982@verge.net.au>
References: <1486118300-12633-1-git-send-email-ulrich.hecht+renesas@gmail.com>
 <1486118300-12633-5-git-send-email-ulrich.hecht+renesas@gmail.com> <20170208105426.GE26982@verge.net.au>
From: Ulrich Hecht <ulrich.hecht+renesas@gmail.com>
Date: Wed, 8 Feb 2017 12:19:55 +0100
Message-ID: <CAO3366ykrZnVCPGra6+Ba70+KA=ZrbBhuei0R7yULsQXMkdj+Q@mail.gmail.com>
Subject: Re: [PATCH v4 4/4] arm64: dts: r8a7796: salvator-x: add SCIF1 (DEBUG1)
To: Simon Horman <horms@verge.net.au>
Cc: Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Geert Uytterhoeven <geert@linux-m68k.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Wolfram Sang <wsa@the-dreams.de>, linux-serial@vger.kernel.org,
        Magnus Damm <magnus.damm@gmail.com>,
        Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Content-Type: text/plain; charset=UTF-8
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On Wed, Feb 8, 2017 at 11:54 AM, Simon Horman <horms@verge.net.au> wrote:
> On Fri, Feb 03, 2017 at 11:38:20AM +0100, Ulrich Hecht wrote:
>> Enables the SCIF hooked up to the DEBUG1 connector.
>>
>> Signed-off-by: Ulrich Hecht <ulrich.hecht+renesas@gmail.com>
>> Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
>
> Hi Ulrich,
>
> could you clarify the dependency of this patch on earlier ones in the
> series. Is it safe to queue this up independently of the other patches?

It does not actually depend on the other patches. I think I included
it here because I used that port for testing. Should be safe.

CU
Uli
