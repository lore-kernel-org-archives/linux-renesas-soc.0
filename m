Return-Path: <kieran+caf_=kieranbingham=gmail.com@ksquared.org.uk>
Return-Path: <laurent.pinchart@ideasonboard.com>
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>, Linux-Renesas <linux-renesas-soc@vger.kernel.org>, Kieran Bingham <kieran.bingham@ideasonboard.com>
Subject: Re: [PATCH 0/2] Salvator-X: Add GPIO keys support
Date: Mon, 14 Nov 2016 15:41:46 +0200
Message-ID: <3311383.qyYI76AWiA@avalon>
In-Reply-To: <CAMuHMdWwEoH79DnVwret7bK9i-f-tXfSVMRSQdk=k-Ps5PUMGQ@mail.gmail.com>
References: <1479128837-30985-1-git-send-email-laurent.pinchart+renesas@ideasonboard.com> <CAMuHMdWwEoH79DnVwret7bK9i-f-tXfSVMRSQdk=k-Ps5PUMGQ@mail.gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
List-ID: <linux-renesas-soc.vger.kernel.org>

Hi Geert,

On Monday 14 Nov 2016 14:35:26 Geert Uytterhoeven wrote:
> On Mon, Nov 14, 2016 at 2:07 PM, Laurent Pinchart wrote:
> > This simple series adds GPIO keys support to both the H3- and M3-W-based
> > Salvator-X boards. Please see individual patches for details.
> 
> Thanks for your series!
> 
> The main reason I haven't sent out a similar series yet is because the GPIOs
> used for the 3 push buttons are shared with the 3 user LEDs. For each of
> them, you have to choose at DT time if you want to use them as buttons or
> as LEDs.
> 
> On ULCB, the same issue is present. For those, we settled on 1 key and 2
> LEDs...
> 
> Looking forward to more comments...

In theory the GPIOs could be shared by the gpio-keys and LED drivers in open-
drain mode. I'm not sure the GPIO subsystem supports that though.

-- 
Regards,

Laurent Pinchart
