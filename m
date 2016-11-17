Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-vk0-f45.google.com ([209.85.213.45]:33444 "EHLO
        mail-vk0-f45.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1750785AbcKQFFO (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 17 Nov 2016 00:05:14 -0500
Received: by mail-vk0-f45.google.com with SMTP id 137so133263916vkl.0
        for <linux-renesas-soc@vger.kernel.org>; Wed, 16 Nov 2016 21:05:14 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <CAO3366ziaB9q5Q9azj8tnL+c4XkEHQ7i+afn-FjtzF=cjYRv4w@mail.gmail.com>
References: <CAO3366ziaB9q5Q9azj8tnL+c4XkEHQ7i+afn-FjtzF=cjYRv4w@mail.gmail.com>
From: Magnus Damm <magnus.damm@gmail.com>
Date: Thu, 17 Nov 2016 14:05:12 +0900
Message-ID: <CANqRtoTDSsrmLcfbHg5Tm0_jf0Xz9XtwNL77KGYiYTJgrRM_WQ@mail.gmail.com>
Subject: Re: ALSA analog audio loopback test tool (atest)
To: Ulrich Hecht <ulrich.hecht@gmail.com>
Cc: Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Content-Type: text/plain; charset=UTF-8
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hi Ulrich,

On Tue, Nov 15, 2016 at 8:56 PM, Ulrich Hecht <ulrich.hecht@gmail.com> wrote:
> Hi!
>
> I have just pushed atest (https://github.com/uli/atest). It's a tool
> to automatically verify operation of analog audio hardware remotely
> (i.e. without being able to listen to the output) using a loopback
> cable between the analog audio input and output.
>
> It works by sending a message encoded by a HAM radio codec (Q15X25)
> out on the output and decoding whatever arrives at the input. It sends
> a different message on every channel and can thus detect if channels
> are swapped around.
>
> Details on using it (especially on how to set up the mixers) can be
> found in the README file. Have fun!

Thanks for your efforts! Quick question, the dependency on zlib seems
to come from using adler32() for checksum comparison. In the code you
seem to compare the total amount of data anyway, so I guess the
checksum seems to be there to get some early notification about
potential mismatch. The potential error will be discovered using the
full-data-comparison later on anyway. I'm not sure if that's the way
the code works, but if so then it should be easy to reduce the number
of dependencies by simply dropping the checksum code. Does that make
sense to you?

Cheers,

/ magnus
