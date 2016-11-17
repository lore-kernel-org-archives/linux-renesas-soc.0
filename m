Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-it0-f46.google.com ([209.85.214.46]:38322 "EHLO
        mail-it0-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751059AbcKQJ1f (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 17 Nov 2016 04:27:35 -0500
Received: by mail-it0-f46.google.com with SMTP id j191so34438323ita.1
        for <linux-renesas-soc@vger.kernel.org>; Thu, 17 Nov 2016 01:27:34 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <CANqRtoTDSsrmLcfbHg5Tm0_jf0Xz9XtwNL77KGYiYTJgrRM_WQ@mail.gmail.com>
References: <CAO3366ziaB9q5Q9azj8tnL+c4XkEHQ7i+afn-FjtzF=cjYRv4w@mail.gmail.com>
 <CANqRtoTDSsrmLcfbHg5Tm0_jf0Xz9XtwNL77KGYiYTJgrRM_WQ@mail.gmail.com>
From: Ulrich Hecht <ulrich.hecht@gmail.com>
Date: Thu, 17 Nov 2016 10:27:33 +0100
Message-ID: <CAO3366xymHfTO=godL1cMxGb-6XAYnq+4WoGNVSQnUvMn+v==g@mail.gmail.com>
Subject: Re: ALSA analog audio loopback test tool (atest)
To: Magnus Damm <magnus.damm@gmail.com>
Cc: Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Content-Type: text/plain; charset=UTF-8
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On Thu, Nov 17, 2016 at 6:05 AM, Magnus Damm <magnus.damm@gmail.com> wrote:
> Thanks for your efforts! Quick question, the dependency on zlib seems
> to come from using adler32() for checksum comparison. In the code you
> seem to compare the total amount of data anyway, so I guess the
> checksum seems to be there to get some early notification about
> potential mismatch. The potential error will be discovered using the
> full-data-comparison later on anyway. I'm not sure if that's the way
> the code works, but if so then it should be easy to reduce the number
> of dependencies by simply dropping the checksum code. Does that make
> sense to you?

The checksum is merely there because it's part of the Q15X25 packet
format. Not having to comply with any standard, we might as well drop
it.

CU
Uli
