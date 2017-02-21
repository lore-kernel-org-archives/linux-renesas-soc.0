Return-Path: <kieranbingham.mailinglists+caf_=kieranbingham=gmail.com@gmail.com>
Return-Path: <linux-kernel-owner@vger.kernel.org>
Date: Tue, 21 Feb 2017 09:32:12 -0800
From: Matthew Giassa <matthew@giassa.net>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Wolfram Sang <wsa@the-dreams.de>,
        Greg KH <gregkh@linuxfoundation.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        driverdevel <devel@driverdev.osuosl.org>
Subject: Re: [PATCH] staging/ks7010: formatting updates.
Message-ID: <20170221173212.bhcqevjoatixnekz@darkstar>
References: <1487650805-30520-1-git-send-email-matthew@giassa.net>
 <CAMuHMdXt4sLgK368Xy9h7ONWUsmeXc3f3gtO=ecQxLwcwhbVkQ@mail.gmail.com>
 <20170221141256.gowusquywtvyr7ac@shinestorm>
 <CAMuHMdUjXUUOGc1ewaegAGCdDXHJz4GOKvNduK1dbbGA1hWi-g@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <CAMuHMdUjXUUOGc1ewaegAGCdDXHJz4GOKvNduK1dbbGA1hWi-g@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

* Geert Uytterhoeven <geert@linux-m68k.org> [2017-02-21 15:22:10 +0100]:

>The first declaration fit nicely on a single line.
>The second one indeed has a few spaces instead of TABs in the
>continuation line. But that can be fixed easily, without moving the
>first parameter to a continuation line.

What would the proposed fix be? A combination of spaces and hard-tabs? I
don't see checkpatch complaining about it, so that could work too.

--
-Matthew Giassa
e:<matthew@giassa.net>
