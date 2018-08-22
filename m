Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-wm0-f67.google.com ([74.125.82.67]:37065 "EHLO
        mail-wm0-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727599AbeHVVnX (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 22 Aug 2018 17:43:23 -0400
Received: by mail-wm0-f67.google.com with SMTP id n11-v6so3122758wmc.2
        for <linux-renesas-soc@vger.kernel.org>; Wed, 22 Aug 2018 11:17:26 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <CAOMZO5BiAyDMSR=2Y-4-1ftNuVtRS59sSJd_cdFmzX=0kgF0Bw@mail.gmail.com>
References: <20180821220233.9202-1-wsa+renesas@sang-engineering.com>
 <20180821220233.9202-6-wsa+renesas@sang-engineering.com> <CAOMZO5AkVNiYMGdED9erL=YMaKcmtS5BzZxw2gO1KLXEaPnD7A@mail.gmail.com>
 <20180822063005.535lytz7hl32rsha@katana> <CAOMZO5BiAyDMSR=2Y-4-1ftNuVtRS59sSJd_cdFmzX=0kgF0Bw@mail.gmail.com>
From: Philippe Ombredanne <pombredanne@nexb.com>
Date: Wed, 22 Aug 2018 20:16:45 +0200
Message-ID: <CAOFm3uF9_rbELx0aYLDXpDnZfi2Z11V1Z4Ktw+DDJT62o2S1kQ@mail.gmail.com>
Subject: Re: [PATCH 05/11] can: rcar: use SPDX identifier for Renesas drivers
To: Fabio Estevam <festevam@gmail.com>
Cc: Wolfram Sang <wsa@the-dreams.de>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Kuninori Morimoto <kuninori.morimoto.gx@gmail.com>,
        Wolfgang Grandegger <wg@grandegger.com>,
        Marc Kleine-Budde <mkl@pengutronix.de>,
        "David S. Miller" <davem@davemloft.net>, linux-can@vger.kernel.org,
        netdev <netdev@vger.kernel.org>,
        linux-kernel <linux-kernel@vger.kernel.org>,
        Thomas Gleixner <tglx@linutronix.de>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hi Fabio,
On Wed, Aug 22, 2018 at 2:55 PM, Fabio Estevam <festevam@gmail.com> wrote:
> On Wed, Aug 22, 2018 at 3:30 AM, Wolfram Sang <wsa@the-dreams.de> wrote:
>>
>>> > +// SPDX-License-Identifier: GPL-2.0-or-later
>>>
>>> According to Documentation/process/license-rules.rst the format should
>>> be like this instead:
>>>
>>> // SPDX-License-Identifier: GPL-2.0+
>>
>> According to https://spdx.org/licenses/ it should be what I did above.
>
> Previous advice I saw was to follow the format described in
> Documentation/process/license-rules.rst
>
> Greg/Philippe,
>
> Any inputs on this matter?
>
> Thanks

IMHO we should always treat and use the
Documentation/process/license-rules.rst as the reference and not SPDX
proper who moves at its own pace and evolves its specs and license ids
independently of where we stand in the kernel.
If this is not right Doc patches are welcomed!
In this is very specific case this has been discussed on list a few
times. If I recall correctly Thomas also had an opinion on this...
So you are correct and this should be for now:
// SPDX-License-Identifier: GPL-2.0+

-- 
Cordially
Philippe Ombredanne
