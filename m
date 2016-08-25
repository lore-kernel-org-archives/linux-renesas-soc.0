Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-ua0-f173.google.com ([209.85.217.173]:36767 "EHLO
        mail-ua0-f173.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1754317AbcHYEfv (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 25 Aug 2016 00:35:51 -0400
Received: by mail-ua0-f173.google.com with SMTP id m60so24712059uam.3
        for <linux-renesas-soc@vger.kernel.org>; Wed, 24 Aug 2016 21:35:50 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <874m6buh17.wl%kuninori.morimoto.gx@renesas.com>
References: <1471959320-16947-1-git-send-email-geert+renesas@glider.be> <874m6buh17.wl%kuninori.morimoto.gx@renesas.com>
From: Magnus Damm <magnus.damm@gmail.com>
Date: Thu, 25 Aug 2016 11:42:25 +0900
Message-ID: <CANqRtoRCoe6-f3ekkvvTsX5co5kj8ZTzUpgfXL8LAHqp6c7=og@mail.gmail.com>
Subject: Re: renesas-drivers-2016-08-23-v4.8-rc3
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Cc: Wolfram Sang <wsa@the-dreams.de>, Simon <horms@verge.net.au>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Content-Type: text/plain; charset=UTF-8
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hi Morimoto-san, everyone,

On Wed, Aug 24, 2016 at 9:58 AM, Kuninori Morimoto
<kuninori.morimoto.gx@renesas.com> wrote:
>
> Hi Geert, Simon, Wolfram
>
>> I have pushed renesas-drivers-2016-08-23-v4.8-rc3 to
>> https://git.kernel.org/cgit/linux/kernel/git/geert/renesas-drivers.git
>>
>> This tree is meant to ease development of platform support and drivers
>> for Renesas ARM SoCs. It is created by merging (a) the for-next branches
>> of various subsystem trees and (b) branches with driver code submitted
>> or planned for submission to maintainers into the development branch of
>> Simon Horman's renesas.git tree.
>>
>> Today's version is based on renesas-devel-20160823-v4.8-rc3.
>
> I noticed that Lager "ES3.0" board can't boot on this and previous -rc2 branch.
> In my and Shimoda-san's check, "ES2.0" seems have no problem.
>
> It start works if I reverted this patch.
>
>         09a28bb8b17e8cab3e9c120b7e37f631cc334a8f
>         ("ARM: dts: lager: use demuxer for IIC3/I2C3")
>

FYI, I have now received the problematic Lager ES3 board from
Morimoto-san and I will install it for remote access.

How can we check which ES version we are running? I recall seeing some
patch from Geert that printed out useful information during boot, any
chance that could make it upstream (if it is not already)?

Cheers,

/ magnus
