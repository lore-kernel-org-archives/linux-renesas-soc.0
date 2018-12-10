Return-Path: <SRS0=Zu5O=OT=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_PASS,USER_AGENT_NEOMUTT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ED288C5CFFE
	for <linux-renesas-soc@archiver.kernel.org>; Mon, 10 Dec 2018 19:00:56 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 44C7820672
	for <linux-renesas-soc@archiver.kernel.org>; Mon, 10 Dec 2018 19:00:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 44C7820672
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=the-dreams.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-renesas-soc-owner@vger.kernel.org
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728844AbeLJTA4 (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Mon, 10 Dec 2018 14:00:56 -0500
Received: from sauhun.de ([88.99.104.3]:35626 "EHLO pokefinder.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728823AbeLJTAz (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 10 Dec 2018 14:00:55 -0500
Received: from localhost (p54B335CF.dip0.t-ipconnect.de [84.179.53.207])
        by pokefinder.org (Postfix) with ESMTPSA id AFE244C0ECB;
        Mon, 10 Dec 2018 20:00:52 +0100 (CET)
Date:   Mon, 10 Dec 2018 20:00:52 +0100
From:   Wolfram Sang <wsa@the-dreams.de>
To:     Geert Uytterhoeven <geert+renesas@glider.be>
Cc:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Jiri Slaby <jslaby@suse.com>,
        Ulrich Hecht <uli+renesas@fpond.eu>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
        Yoshinori Sato <ysato@users.sourceforge.jp>,
        linux-renesas-soc@vger.kernel.org, linux-sh@vger.kernel.org,
        linux-serial@vger.kernel.org
Subject: Re: [PATCH v3 3/4] serial: sh-sci: Resume PIO in sci_rx_interrupt()
 on DMA failure
Message-ID: <20181210190052.admylepukreo23j3@ninjato>
References: <20181210182154.20357-1-geert+renesas@glider.be>
 <20181210182154.20357-4-geert+renesas@glider.be>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="5tpyya7ld3dzzz5w"
Content-Disposition: inline
In-Reply-To: <20181210182154.20357-4-geert+renesas@glider.be>
User-Agent: NeoMutt/20170113 (1.7.2)
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org
Message-ID: <20181210190052.6TrcTp1NS0avhwMzdfUOpa0dJ4WMHfyBXUO5bImqGj4@z>


--5tpyya7ld3dzzz5w
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Geert,

>  	if (!port_lock_held)
>  		spin_unlock_irqrestore(&port->lock, flags);
> +	return -1;

-Esomething here...

>  		} else {
> +			if (sci_submit_rx(s, false))
> +				goto handle_pio;

and 'sci_submit_rx() < 0' here? I think it makes it more readable that
this is an error case then. 'if sci_submit_rx() do_something' sounds a
bit like the good case if boolean logic was used.

Thanks for picking this up again,

   Wolfram


--5tpyya7ld3dzzz5w
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAlwOt+AACgkQFA3kzBSg
KbYjoA//TB9WHPJ3lfL102I7I3tkN6qFdL7OIMPExLCZ21eaeC+DhOA81Dl04Hs/
auF2u2QiSkpLG8JApsZHOG9D5CybAeYVGH8DbXetyied02KaKrsCWEdH8HQfpn5A
1g4eGKGmoF91gDoNfJnJPuSadthetYvIG+tlNEFbbHyf//U6LaDpaEK97rsEztGR
LqdZcSL+CUsON4X/UoqQnoHkX/dimN28GVOsscqHuSnfXXij8R0zQttjx6vvtuNA
HEnXIGLPAAlAZoArfbYfCgwLzG+Cl1LgEGJIb7avh9qS+5YapSKOvTN3NeF6pyTH
uJUIE5hOoTKtacfFmIubRXQHAH2HyGH/eOteAN33NDtYL9X5R3GRCQwjcFF177jE
gNgBAOqPL+x6Y/NZOS0PvPI+j+hWo5U8Gubj/jNib1S6wj4ifRP4GlRcgoY5vuAf
XgbaMFEXsETeNWVk4H/7UeEh+tRx4MkBVqDKwR/ijVp23XuRUuuz+Pkl0rGSmPA7
gVRok/3TgXupprRtMcdepcNtz33fF82EowDyhGLzsDTg545Y7L1x+kfkcN5o3vRU
DysWALiWPcPC/X6Ei8gbvB0p3cncWgLA7WIst92mzAz8NWuT6ZvB6/PDZe67Xa/F
fT0GIpjxiK9jOiF2gyeli9ENkdWnA8iuVVPRCtuDVFP5LcYEwiM=
=iOlm
-----END PGP SIGNATURE-----

--5tpyya7ld3dzzz5w--
