Return-Path: <kieranbingham.mailinglists+caf_=kieranbingham=gmail.com@gmail.com>
Return-Path: <linux-kernel-owner@vger.kernel.org>
Date: Tue, 21 Feb 2017 06:12:56 -0800
From: Matthew Giassa <matthew@giassa.net>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Wolfram Sang <wsa@the-dreams.de>,
        Greg KH <gregkh@linuxfoundation.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        driverdevel <devel@driverdev.osuosl.org>
Subject: Re: [PATCH] staging/ks7010: formatting updates.
Message-ID: <20170221141256.gowusquywtvyr7ac@shinestorm>
References: <1487650805-30520-1-git-send-email-matthew@giassa.net>
 <CAMuHMdXt4sLgK368Xy9h7ONWUsmeXc3f3gtO=ecQxLwcwhbVkQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <CAMuHMdXt4sLgK368Xy9h7ONWUsmeXc3f3gtO=ecQxLwcwhbVkQ@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

* Geert Uytterhoeven <geert@linux-m68k.org> [2017-02-21 08:59:18 +0100]:

Hi Geert,

>On Tue, Feb 21, 2017 at 5:20 AM, Matthew Giassa <matthew@giassa.net> wrote:
>> Please pardon the earlier e-mail which was missing the changelog text.
>
>This line should be between the "---" and the diffstat below.
>

Thank you.

>> Some additional style changes to appease checkpatch.
>
>Which additional style changes?
>

* Aligning function parameters in the function prototypes.
* Removing "double newlines". where checkpatch warns about them.
* Spaces between macro names, '+', and integer literals.
* Swapped out some line comments with C-style equivalent.
* Removing trailing spaces.


>> ---
>>  drivers/staging/ks7010/ks_wlan_ioctl.h | 80 +++++++++++++++++-----------------
>>  1 file changed, 41 insertions(+), 39 deletions(-)
>>
>> diff --git a/drivers/staging/ks7010/ks_wlan_ioctl.h b/drivers/staging/ks7010/ks_wlan_ioctl.h
>> index 84554b6..00eec18 100644
>> --- a/drivers/staging/ks7010/ks_wlan_ioctl.h
>> +++ b/drivers/staging/ks7010/ks_wlan_ioctl.h
>
>>  #include "ks_wlan.h"
>>  #include <linux/netdevice.h>
>>
>> -int ks_wlan_read_config_file(struct ks_wlan_private *priv);
>> -int ks_wlan_setup_parameter(struct ks_wlan_private *priv,
>> -                            unsigned int commit_flag);
>> +int ks_wlan_read_config_file(
>> +               struct ks_wlan_private *priv);
>> +int ks_wlan_setup_parameter(
>> +               struct ks_wlan_private *priv,
>> +               unsigned int commit_flag);
>
>Really?
>If checkpatch complained about the above, you should file a bug report
>against checkpatch.
>
>Gr{oetje,eeting}s,

It seems to be a very deliberate message from checkpatch, complaining
about the alignment of the beginning of individual function parameters
in the prototype. The only two configurations which appeased it was the
changes I put in above, or a combination of hard-tabs (8-wide, noexpand)
and spaces, which I thought was ugly.

-- 

Matthew
