Return-Path: <kieranbingham.mailinglists+caf_=kieranbingham=gmail.com@gmail.com>
Return-Path: <linux-kernel-owner@vger.kernel.org>
Message-ID: <1487702851.2853.25.camel@perches.com>
Subject: Re: [PATCH] staging/ks7010: formatting updates.
From: Joe Perches <joe@perches.com>
To: Matthew Giassa <matthew@giassa.net>,
        Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Wolfram Sang <wsa@the-dreams.de>,
        Greg KH <gregkh@linuxfoundation.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        driverdevel <devel@driverdev.osuosl.org>
Date: Tue, 21 Feb 2017 10:47:31 -0800
In-Reply-To: <20170221173212.bhcqevjoatixnekz@darkstar>
References: <1487650805-30520-1-git-send-email-matthew@giassa.net>
         <CAMuHMdXt4sLgK368Xy9h7ONWUsmeXc3f3gtO=ecQxLwcwhbVkQ@mail.gmail.com>
         <20170221141256.gowusquywtvyr7ac@shinestorm>
         <CAMuHMdUjXUUOGc1ewaegAGCdDXHJz4GOKvNduK1dbbGA1hWi-g@mail.gmail.com>
         <20170221173212.bhcqevjoatixnekz@darkstar>
Content-Type: text/plain; charset="ISO-8859-1"
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Sender: linux-kernel-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On Tue, 2017-02-21 at 09:32 -0800, Matthew Giassa wrote:
> * Geert Uytterhoeven <geert@linux-m68k.org> [2017-02-21 15:22:10 +0100]:
> 
> > The first declaration fit nicely on a single line.
> > The second one indeed has a few spaces instead of TABs in the
> > continuation line. But that can be fixed easily, without moving the
> > first parameter to a continuation line.
> 
> What would the proposed fix be? A combination of spaces and hard-tabs? I
> don't see checkpatch complaining about it, so that could work too.

Maximal initial tabs, followed by required spaces to align
to open parenthesis

So from:

int ks_wlan_setup_parameter(struct ks_wlan_private *priv,
		             unsigned int commit_flag);

(2 tabs followed by 13 spaces)

to:

int ks_wlan_setup_parameter(struct ks_wlan_private *priv,
			    unsigned int commit_flag);

(3 tabs followed by 4 spaces)
