Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-oi0-f53.google.com ([209.85.218.53]:42150 "EHLO
        mail-oi0-f53.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S965109AbeCSQlG (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 19 Mar 2018 12:41:06 -0400
Received: by mail-oi0-f53.google.com with SMTP id c18so14857165oiy.9
        for <linux-renesas-soc@vger.kernel.org>; Mon, 19 Mar 2018 09:41:06 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <20180316085551.GG14155@phenom.ffwll.local>
References: <1521125144-28614-1-git-send-email-ulrich.hecht+renesas@gmail.com> <20180316085551.GG14155@phenom.ffwll.local>
From: Ulrich Hecht <ulrich.hecht+renesas@gmail.com>
Date: Mon, 19 Mar 2018 17:41:05 +0100
Message-ID: <CAO3366wA2iUko95gJghTLptZ0HvS6iZzkSKp1NezyH3_kkoEAw@mail.gmail.com>
Subject: Re: [Intel-gfx] [PATCH igt 0/8] Non-Intel test suite fixes
To: Daniel Vetter <daniel@ffwll.ch>
Cc: intel-gfx@lists.freedesktop.org,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Laurent <laurent.pinchart@ideasonboard.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On Fri, Mar 16, 2018 at 9:55 AM, Daniel Vetter <daniel@ffwll.ch> wrote:
> On Thu, Mar 15, 2018 at 03:45:36PM +0100, Ulrich Hecht wrote:
>> Hi!
>>
>> I have run the tests on a Renesas R-Car M3-W's DU device, and have found a
>> number of false negatives that mostly stem from use of Intel-specifics
>> without checking if that makes sense first. So here's a bunch of fixes for
>> those, hope they are generic enough for upstreaming.
>
> Nice, other people using this! Do you plan to maintain this actively going
> forward, or is this more a one-off effort?

For now, this is just an attempt at evaluating if this works for us.
It has caught a few things that look like legitimate bugs to me,
though...

CU
Uli
