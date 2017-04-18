Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-io0-f196.google.com ([209.85.223.196]:35265 "EHLO
        mail-io0-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752481AbdDRJkz (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 18 Apr 2017 05:40:55 -0400
Received: by mail-io0-f196.google.com with SMTP id d203so29722462iof.2
        for <linux-renesas-soc@vger.kernel.org>; Tue, 18 Apr 2017 02:40:54 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <11572546.LuaYKYJzSt@avalon>
References: <4407429.F5AJ3MCJrM@avalon> <CAMuHMdW8H1YCXVY3Sw1YNYkmdw6rj2e=-u9jtWS9FAth5v-ekA@mail.gmail.com>
 <11572546.LuaYKYJzSt@avalon>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 18 Apr 2017 11:40:53 +0200
Message-ID: <CAMuHMdUJmBsO6oU7Ne1w8gx-Ew4PRFrV6XRcmpBKVrQ548vzhA@mail.gmail.com>
Subject: Re: [GIT PULL FOR renesas-drivers] VSP1 rotation and histogram
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Content-Type: text/plain; charset=UTF-8
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hi Laurent,

On Tue, Apr 18, 2017 at 11:35 AM, Laurent Pinchart
<laurent.pinchart@ideasonboard.com> wrote:
> On Tuesday 18 Apr 2017 11:01:59 Geert Uytterhoeven wrote:
>> On Mon, Mar 6, 2017 at 1:47 AM, Laurent Pinchart wrote:
>> > The following changes since commit
> 130f8756b9b83c0137ee0d587152a7ef3e10f74b:
>> >   v4l: vsp1: Register pipe with output WPF (2017-03-05 01:53:46 +0200)
>> >
>> > are available in the git repository at:
>> >   git://linuxtv.org/pinchartl/media.git vsp1/histogram
>>
>> Dropped, too many conflicts.
>
> And the code is in the linuxtv master branch anyway, scheduled for merge in
> v4.12-rc1.

Not the HGO and HGT support, cfr.

    git cherry -v next-20170418  8bcdadfb22f218a4

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
