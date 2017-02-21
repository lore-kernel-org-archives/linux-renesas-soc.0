Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-pg0-f66.google.com ([74.125.83.66]:36539 "EHLO
        mail-pg0-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1753566AbdBUTsj (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 21 Feb 2017 14:48:39 -0500
Date: Tue, 21 Feb 2017 11:48:33 -0800
From: Matthew Giassa <matthew@giassa.net>
To: Joe Perches <joe@perches.com>
Cc: Geert Uytterhoeven <geert@linux-m68k.org>,
        Wolfram Sang <wsa@the-dreams.de>,
        Greg KH <gregkh@linuxfoundation.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        driverdevel <devel@driverdev.osuosl.org>
Subject: Re: [PATCH] staging/ks7010: formatting updates.
Message-ID: <20170221194833.b34zc5iqxrydadrt@darkstar>
References: <1487650805-30520-1-git-send-email-matthew@giassa.net>
 <CAMuHMdXt4sLgK368Xy9h7ONWUsmeXc3f3gtO=ecQxLwcwhbVkQ@mail.gmail.com>
 <20170221141256.gowusquywtvyr7ac@shinestorm>
 <CAMuHMdUjXUUOGc1ewaegAGCdDXHJz4GOKvNduK1dbbGA1hWi-g@mail.gmail.com>
 <20170221173212.bhcqevjoatixnekz@darkstar>
 <1487702851.2853.25.camel@perches.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <1487702851.2853.25.camel@perches.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

* Joe Perches <joe@perches.com> [2017-02-21 10:47:31 -0800]:

>On Tue, 2017-02-21 at 09:32 -0800, Matthew Giassa wrote:
>> * Geert Uytterhoeven <geert@linux-m68k.org> [2017-02-21 15:22:10 +0100]:
>>
>> > The first declaration fit nicely on a single line.
>> > The second one indeed has a few spaces instead of TABs in the
>> > continuation line. But that can be fixed easily, without moving the
>> > first parameter to a continuation line.
>>
>> What would the proposed fix be? A combination of spaces and hard-tabs? I
>> don't see checkpatch complaining about it, so that could work too.
>
>Maximal initial tabs, followed by required spaces to align
>to open parenthesis
>

Thank you Joe. I will change it accordingly. Is there a supplementary
style guide that covers these finer details?

Cheers!

--
-Matthew Giassa
e:<matthew@giassa.net>
