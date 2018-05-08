Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-ot0-f171.google.com ([74.125.82.171]:38248 "EHLO
        mail-ot0-f171.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1755271AbeEHQDH (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 8 May 2018 12:03:07 -0400
Received: by mail-ot0-f171.google.com with SMTP id n3-v6so377811ota.5
        for <linux-renesas-soc@vger.kernel.org>; Tue, 08 May 2018 09:03:07 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <14824305.yKoR7O8rpT@avalon>
References: <1521125144-28614-1-git-send-email-ulrich.hecht+renesas@gmail.com> <14824305.yKoR7O8rpT@avalon>
From: Ulrich Hecht <ulrich.hecht+renesas@gmail.com>
Date: Tue, 8 May 2018 18:03:05 +0200
Message-ID: <CAO3366zOFVyNsu2vmzfOsgtBuUYfb1gv9kjJgfwTU8Xw=xagxg@mail.gmail.com>
Subject: Re: [PATCH igt 0/8] Non-Intel test suite fixes
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: intel-gfx@lists.freedesktop.org,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On Fri, Apr 27, 2018 at 6:03 PM, Laurent Pinchart
<laurent.pinchart@ideasonboard.com> wrote:
> Hi Ulrich,
>
> On Thursday, 15 March 2018 16:45:36 EEST Ulrich Hecht wrote:
>> Hi!
>>
>> I have run the tests on a Renesas R-Car M3-W's DU device, and have found a
>> number of false negatives that mostly stem from use of Intel-specifics
>> without checking if that makes sense first. So here's a bunch of fixes for
>> those, hope they are generic enough for upstreaming.
>
> I'm looking for instructions on how to compile and use igt on elinux.org but
> can't find them. Could you please point me to the relevant page ?

Here's a wikified version of what I have sent to our QA people:

https://elinux.org/R-Car/Tests:igt

CU
Uli
