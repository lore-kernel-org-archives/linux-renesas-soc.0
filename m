Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-lf0-f54.google.com ([209.85.215.54]:32898 "EHLO
	mail-lf0-f54.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752083AbcFCLZT (ORCPT
	<rfc822;linux-renesas-soc@vger.kernel.org>);
	Fri, 3 Jun 2016 07:25:19 -0400
Received: by mail-lf0-f54.google.com with SMTP id s64so52536268lfe.0
        for <linux-renesas-soc@vger.kernel.org>; Fri, 03 Jun 2016 04:25:18 -0700 (PDT)
Subject: Re: [PATCH v3 11/11] serial: sh-sci: Add DT support for dedicated
 RTS/CTS
To: Geert Uytterhoeven <geert+renesas@glider.be>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Jiri Slaby <jslaby@suse.com>,
	Peter Hurley <peter@hurleysoftware.com>
References: <1464948011-377-1-git-send-email-geert+renesas@glider.be>
 <1464948011-377-12-git-send-email-geert+renesas@glider.be>
Cc: Magnus Damm <magnus.damm@gmail.com>,
	Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
	Yoshinori Sato <ysato@users.sourceforge.jp>,
	linux-serial@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
	linux-sh@vger.kernel.org, linux-kernel@vger.kernel.org
From: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Message-ID: <c9fa56b8-da57-a6ed-0dca-c849851ac0f3@cogentembedded.com>
Date: Fri, 3 Jun 2016 14:25:15 +0300
MIME-Version: 1.0
In-Reply-To: <1464948011-377-12-git-send-email-geert+renesas@glider.be>
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hello.

On 6/3/2016 1:00 PM, Geert Uytterhoeven wrote:

> Add support for indicating the availability of dedicated lines for
> RTS/CTS hardware flow control, using the standard "uart-has-rtscts" DT
> property.
>
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> ---
> v3:
>   - No changes,
>
> v2:
>   - New.
> ---
>  drivers/tty/serial/sh-sci.c | 3 +++
>  1 file changed, 3 insertions(+)
>
> diff --git a/drivers/tty/serial/sh-sci.c b/drivers/tty/serial/sh-sci.c
> index 02b240a02dc6a593..d9cb0d70fceef07d 100644
> --- a/drivers/tty/serial/sh-sci.c
> +++ b/drivers/tty/serial/sh-sci.c
> @@ -2999,6 +2999,9 @@ sci_parse_dt(struct platform_device *pdev, unsigned int *dev_id)
>  	p->regtype = SCI_OF_REGTYPE(match->data);
>  	p->scscr = SCSCR_RE | SCSCR_TE;
>
> +	if (of_find_property(np, "uart-has-rtscts", NULL))

    of_property_read_bool() maybe?

> +		p->capabilities |= SCIx_HAVE_RTSCTS;
> +
>  	return p;
>  }
>

MBR, Sergei
