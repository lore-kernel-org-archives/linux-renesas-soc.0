Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-io0-f196.google.com ([209.85.223.196]:40080 "EHLO
        mail-io0-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1753263AbeGBTBR (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 2 Jul 2018 15:01:17 -0400
Received: by mail-io0-f196.google.com with SMTP id t135-v6so15646107iof.7
        for <linux-renesas-soc@vger.kernel.org>; Mon, 02 Jul 2018 12:01:17 -0700 (PDT)
Subject: Re: [PATCH 4/4] serial: sh-sci: Stop RX FIFO timer during port
 shutdown
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Geert Uytterhoeven <geert+renesas@glider.be>,
        Greg KH <gregkh@linuxfoundation.org>,
        Jiri Slaby <jslaby@suse.com>,
        Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
        Ulrich Hecht <ulrich.hecht+renesas@gmail.com>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>,
        "open list:SERIAL DRIVERS" <linux-serial@vger.kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Linux-sh list <linux-sh@vger.kernel.org>
References: <20180629142513.20743-1-geert+renesas@glider.be>
 <20180629142513.20743-8-geert+renesas@glider.be>
 <c3d1884b-baab-241d-e4ee-745ed87dbb3b@landley.net>
 <CAMuHMdUu5Kgq6B3pE8SovP6Kv=gpWF7g8qSFTs2d0hoNo3TrEg@mail.gmail.com>
From: Rob Landley <rob@landley.net>
Message-ID: <b5e03d7d-d7d5-4e31-5d9a-036521f30ff5@landley.net>
Date: Mon, 2 Jul 2018 14:01:08 -0500
MIME-Version: 1.0
In-Reply-To: <CAMuHMdUu5Kgq6B3pE8SovP6Kv=gpWF7g8qSFTs2d0hoNo3TrEg@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On 07/02/2018 04:50 AM, Geert Uytterhoeven wrote:
> Hi Rob,
> 
> On Sun, Jul 1, 2018 at 7:27 PM Rob Landley <rob@landley.net> wrote:
>> On 06/29/2018 09:25 AM, Geert Uytterhoeven wrote:
>>> The RX FIFO timer may be armed when the port is shut down, hence the
>>> timer function may still be called afterwards.
>>>
>>> Fix this race condition by deleting the timer during port shutdown.
>>
>> Will any of this make the qemu-system-sh4 serial console work again?
> 
> Probably not, as none of these patches touch the qemu source tree.

So we remain well into the second year of each project pointing the finger at
the other on this, and nothing getting fixed. And the workaround remains "run a
kernel from before February 2017 if you want a working serial console under qemu.

Good to know,

Rob
