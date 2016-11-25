Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-vk0-f52.google.com ([209.85.213.52]:33740 "EHLO
        mail-vk0-f52.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751957AbcKYIVw (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 25 Nov 2016 03:21:52 -0500
Received: by mail-vk0-f52.google.com with SMTP id 137so38632340vkl.0
        for <linux-renesas-soc@vger.kernel.org>; Fri, 25 Nov 2016 00:21:52 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <CAO3366xymHfTO=godL1cMxGb-6XAYnq+4WoGNVSQnUvMn+v==g@mail.gmail.com>
References: <CAO3366ziaB9q5Q9azj8tnL+c4XkEHQ7i+afn-FjtzF=cjYRv4w@mail.gmail.com>
 <CANqRtoTDSsrmLcfbHg5Tm0_jf0Xz9XtwNL77KGYiYTJgrRM_WQ@mail.gmail.com> <CAO3366xymHfTO=godL1cMxGb-6XAYnq+4WoGNVSQnUvMn+v==g@mail.gmail.com>
From: Magnus Damm <magnus.damm@gmail.com>
Date: Fri, 25 Nov 2016 17:21:50 +0900
Message-ID: <CANqRtoQA3UxG8=y+=SOhr=6jVvrQjFfrWdadKJKtc9TSi8whZQ@mail.gmail.com>
Subject: Re: ALSA analog audio loopback test tool (atest)
To: Ulrich Hecht <ulrich.hecht@gmail.com>
Cc: Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Content-Type: text/plain; charset=UTF-8
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hi Ulrich,

On Thu, Nov 17, 2016 at 6:27 PM, Ulrich Hecht <ulrich.hecht@gmail.com> wrote:
> On Thu, Nov 17, 2016 at 6:05 AM, Magnus Damm <magnus.damm@gmail.com> wrote:
>> Thanks for your efforts! Quick question, the dependency on zlib seems
>> to come from using adler32() for checksum comparison. In the code you
>> seem to compare the total amount of data anyway, so I guess the
>> checksum seems to be there to get some early notification about
>> potential mismatch. The potential error will be discovered using the
>> full-data-comparison later on anyway. I'm not sure if that's the way
>> the code works, but if so then it should be easy to reduce the number
>> of dependencies by simply dropping the checksum code. Does that make
>> sense to you?
>
> The checksum is merely there because it's part of the Q15X25 packet
> format. Not having to comply with any standard, we might as well drop
> it.

Thanks, I agree!

FYI, last week I did some limited testing myself but I could not get
your test app to work on my remote boards. Probably because the
analogue loop back cables were missing! Since then I've seen some
positive result on one local board with a cable attached, so I intend
to get a bunch of analogue loop back cables for the different boards
in the remote farm in the not so distant future.

Cheers,

/ magnus
