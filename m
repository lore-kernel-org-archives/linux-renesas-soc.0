Return-Path: <kieranbingham.mailinglists+caf_=kieranbingham=gmail.com@gmail.com>
Return-Path: <linux-kernel-owner@vger.kernel.org>
MIME-Version: 1.0
In-Reply-To: <20170221141256.gowusquywtvyr7ac@shinestorm>
References: <1487650805-30520-1-git-send-email-matthew@giassa.net>
 <CAMuHMdXt4sLgK368Xy9h7ONWUsmeXc3f3gtO=ecQxLwcwhbVkQ@mail.gmail.com> <20170221141256.gowusquywtvyr7ac@shinestorm>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 21 Feb 2017 15:22:10 +0100
Message-ID: <CAMuHMdUjXUUOGc1ewaegAGCdDXHJz4GOKvNduK1dbbGA1hWi-g@mail.gmail.com>
Subject: Re: [PATCH] staging/ks7010: formatting updates.
To: Matthew Giassa <matthew@giassa.net>
Cc: Wolfram Sang <wsa@the-dreams.de>,
        Greg KH <gregkh@linuxfoundation.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        driverdevel <devel@driverdev.osuosl.org>
Content-Type: text/plain; charset=UTF-8
Sender: linux-kernel-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hi Matthew,

On Tue, Feb 21, 2017 at 3:12 PM, Matthew Giassa <matthew@giassa.net> wrote:
>>>  drivers/staging/ks7010/ks_wlan_ioctl.h | 80
>>> +++++++++++++++++-----------------
>>>  1 file changed, 41 insertions(+), 39 deletions(-)
>>>
>>> diff --git a/drivers/staging/ks7010/ks_wlan_ioctl.h
>>> b/drivers/staging/ks7010/ks_wlan_ioctl.h
>>> index 84554b6..00eec18 100644
>>> --- a/drivers/staging/ks7010/ks_wlan_ioctl.h
>>> +++ b/drivers/staging/ks7010/ks_wlan_ioctl.h
>>
>>
>>>  #include "ks_wlan.h"
>>>  #include <linux/netdevice.h>
>>>
>>> -int ks_wlan_read_config_file(struct ks_wlan_private *priv);
>>> -int ks_wlan_setup_parameter(struct ks_wlan_private *priv,
>>> -                            unsigned int commit_flag);
>>> +int ks_wlan_read_config_file(
>>> +               struct ks_wlan_private *priv);
>>> +int ks_wlan_setup_parameter(
>>> +               struct ks_wlan_private *priv,
>>> +               unsigned int commit_flag);
>>
>>
>> Really?
>> If checkpatch complained about the above, you should file a bug report
>> against checkpatch.
>
> It seems to be a very deliberate message from checkpatch, complaining
> about the alignment of the beginning of individual function parameters
> in the prototype. The only two configurations which appeased it was the
> changes I put in above, or a combination of hard-tabs (8-wide, noexpand)
> and spaces, which I thought was ugly.

The first declaration fit nicely on a single line.
The second one indeed has a few spaces instead of TABs in the
continuation line. But that can be fixed easily, without moving the
first parameter to a continuation line.

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
