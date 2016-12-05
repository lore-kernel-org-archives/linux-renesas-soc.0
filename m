Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from 8.mo68.mail-out.ovh.net ([46.105.74.219]:44700 "EHLO
        8.mo68.mail-out.ovh.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752288AbcLEJob (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 5 Dec 2016 04:44:31 -0500
Received: from player711.ha.ovh.net (b9.ovh.net [213.186.33.59])
        by mo68.mail-out.ovh.net (Postfix) with ESMTP id B2D56169A6
        for <linux-renesas-soc@vger.kernel.org>; Mon,  5 Dec 2016 10:08:18 +0100 (CET)
Subject: Re: [RFC 3/3] spidev: Add back "linux,spidev" as compatible
To: Geert Uytterhoeven <geert@linux-m68k.org>
References: <1480693434-9415-1-git-send-email-jacopo@jmondi.org>
 <1480693434-9415-4-git-send-email-jacopo@jmondi.org>
 <CAMuHMdVyhNQjiJmS_Fr3TEBUz2H5dhySmeXesOFXokx+Wsn1=g@mail.gmail.com>
Cc: Magnus Damm <magnus.damm@gmail.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>
From: "jacopo@jmondi.org" <jacopo@jmondi.org>
Message-ID: <4c061516-6bd1-b1be-4d75-a4f9c94b6dfa@jmondi.org>
Date: Mon, 5 Dec 2016 10:08:11 +0100
MIME-Version: 1.0
In-Reply-To: <CAMuHMdVyhNQjiJmS_Fr3TEBUz2H5dhySmeXesOFXokx+Wsn1=g@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hi Geert,

On 03/12/2016 11:30, Geert Uytterhoeven wrote:
> Hi Jacopo,
>
> On Fri, Dec 2, 2016 at 4:43 PM, Jacopo Mondi <jacopo@jmondi.org> wrote:
>> spidev is not meant to be configured directly from DTS anymore.
>> Since we're prototyping, add the "linux,spidev" compatibility string
>> back
>
> I guess you needed this because you used "linux,spidev" in your DTS?
> With "spidev", it should work out-of-the-box.
>

Oh, yes it does!
I can drop this patch and use "spidev" in [2/3]

Thanks
    j



> Gr{oetje,eeting}s,
>
>                         Geert
>
> --
> Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org
>
> In personal conversations with technical people, I call myself a hacker. But
> when I'm talking to journalists I just say "programmer" or something like that.
>                                 -- Linus Torvalds
>
