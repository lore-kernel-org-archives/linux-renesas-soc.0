Return-Path: <masonccyang@mxic.com.tw>
In-Reply-To: <93bb36af-8bdb-c90e-3777-62fe1a48f76a@gmail.com>
References: <1543828720-18345-1-git-send-email-masonccyang@mxic.com.tw> <1543828720-18345-2-git-send-email-masonccyang@mxic.com.tw> <cebe44a3-80be-9091-e70b-acba6f3fff4f@gmail.com> <OF0ED3C578.141B72CA-ON4825835A.0025CA62-4825835A.002A7BDF@mxic.com.tw> <84e3c55b-687e-28f6-0a7c-1c48c822ef05@gmail.com> <OFC9FB54F8.34B3A8B7-ON4825835B.00267480-4825835B.0029455C@mxic.com.tw> <93bb36af-8bdb-c90e-3777-62fe1a48f76a@gmail.com>
To: "Marek Vasut" <marek.vasut@gmail.com>
Cc: boris.brezillon@bootlin.com, broonie@kernel.org,
        "Geert Uytterhoeven"<geert+renesas@glider.be>,
        "Simon Horman" <horms@verge.net.au>, juliensu@mxic.com.tw,
        linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        linux-spi@vger.kernel.org, zhengxunli@mxic.com.tw
Subject: Re: [PATCH v2 1/2] spi: Add Renesas R-Car Gen3 RPC SPI controller driver
MIME-Version: 1.0
Message-ID: <OF0CE74C5C.20959BA6-ON4825835C.0026C7BC-4825835C.0028B3A4@mxic.com.tw>
From: masonccyang@mxic.com.tw
Date: Fri, 7 Dec 2018 15:24:34 +0800
Content-Type: multipart/alternative; boundary="=_alternative 0028B3A14825835C_="
List-ID: <linux-renesas-soc.vger.kernel.org>

This is a multipart message in MIME format.
--=_alternative 0028B3A14825835C_=
Content-Type: text/plain; charset="US-ASCII"


Hi Marek,

> >> >> > +
> >> >> > +         regmap_write(rpc->regmap, RPC_SMWDR0,
> >> >> > +                 *(u32 *)(tx_buf + pos));
> >> >>
> >> >> *(u32 *) cast is probably not needed , fix casts globally.
> >> >
> >> > It must have it!
> >>
> >> Why ?
> > 
> > Get a compiler warning due to tx_bug is void *, as Geert replied.
> 
> The compiler warning is usually an indication that this is something to
> check, not silence with a type cast.
> 
> > Using get_unaligned(), patched code would be
> > -----------------------------------------------------
> > regmap_write(rpc->regmap, RPC_SMWDR0,
> >                  get_unaligned((u32 *)(tx_buf + pos)));               
 
> > ----------------------------------------------------
> 
> Do you need the cast if you use get_unaligned() ?

yes!

> >> >> > +
> >> >> > +static const struct regmap_range rpc_spi_volatile_ranges[] = {
> >> >> > +   regmap_reg_range(RPC_SMRDR0, RPC_SMRDR0),
> >> >> > +   regmap_reg_range(RPC_SMWDR0, RPC_SMWDR0),
> >> >>
> >> >> Why is SMWDR volatile ?
> >> >
> >> > No matter is write-back or write-through.
> >>
> >> Oh, do you want to assure the SMWDR value is always written directly 
to
> >> the hardware ?
> > 
> > yes,
> > 
> >>
> >> btw. I think SMRDR should be precious ?
> > 
> > so, you think I should drop
> > regmap_reg_range(RPC_SMWDR0, RPC_SMWDR0)
> 
> No, I am asking whether SMRDR should be marked precious or not.
> 

I don't think so,
precious_reg: the register should not be read outside of
call from driver, i.e,. a clear on read interrupt status register.


> [...]
> 
> > CONFIDENTIALITY NOTE:
> > 
> > This e-mail and any attachments may contain confidential information
> > and/or personal data, which is protected by applicable laws. Please be
> > reminded that duplication, disclosure, distribution, or use of this
> > e-mail (and/or its attachments) or any part thereof is prohibited. If
> > you receive this e-mail in error, please notify us immediately and
> > delete this mail as well as its attachment(s) from your system. In
> > addition, please be informed that collection, processing, and/or use 
of
> > personal data is prohibited unless expressly permitted by personal 
data
> > protection laws. Thank you for your attention and cooperation.
> > 
> > Macronix International Co., Ltd.
> 
> Can you do something about this ^ please ?
> 

I submit the patch file is by another remote git-server, which
supports git-format patch, git send-mail and so on.
But it can't receive email.

I get/send email are by office PC w/ Notes system and 
this "CONFx NOTE:" is appended automatically by Notes mail-server.

Please just never mind it.

thanks & best regards,
Mason



CONFIDENTIALITY NOTE:

This e-mail and any attachments may contain confidential information 
and/or personal data, which is protected by applicable laws. Please be 
reminded that duplication, disclosure, distribution, or use of this e-mail 
(and/or its attachments) or any part thereof is prohibited. If you receive 
this e-mail in error, please notify us immediately and delete this mail as 
well as its attachment(s) from your system. In addition, please be 
informed that collection, processing, and/or use of personal data is 
prohibited unless expressly permitted by personal data protection laws. 
Thank you for your attention and cooperation.

Macronix International Co., Ltd.

=====================================================================



============================================================================

CONFIDENTIALITY NOTE:

This e-mail and any attachments may contain confidential information and/or personal data, which is protected by applicable laws. Please be reminded that duplication, disclosure, distribution, or use of this e-mail (and/or its attachments) or any part thereof is prohibited. If you receive this e-mail in error, please notify us immediately and delete this mail as well as its attachment(s) from your system. In addition, please be informed that collection, processing, and/or use of personal data is prohibited unless expressly permitted by personal data protection laws. Thank you for your attention and cooperation.

Macronix International Co., Ltd.

=====================================================================

--=_alternative 0028B3A14825835C_=
Content-Type: text/html; charset="US-ASCII"


<tt><font size=2><br>
Hi Marek,<br>
<br>
&gt; &gt;&gt; &gt;&gt; &gt; +<br>
&gt; &gt;&gt; &gt;&gt; &gt; + &nbsp; &nbsp; &nbsp; &nbsp; regmap_write(rpc-&gt;regmap,
RPC_SMWDR0,<br>
&gt; &gt;&gt; &gt;&gt; &gt; + &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
&nbsp; &nbsp; *(u32 *)(tx_buf + pos));<br>
&gt; &gt;&gt; &gt;&gt;<br>
&gt; &gt;&gt; &gt;&gt; *(u32 *) cast is probably not needed , fix casts
globally.<br>
&gt; &gt;&gt; &gt;<br>
&gt; &gt;&gt; &gt; It must have it!<br>
&gt; &gt;&gt;<br>
&gt; &gt;&gt; Why ?<br>
&gt; &gt; <br>
&gt; &gt; Get a compiler warning due to tx_bug is void *, as Geert replied.<br>
&gt; <br>
&gt; The compiler warning is usually an indication that this is something
to<br>
&gt; check, not silence with a type cast.<br>
&gt; <br>
&gt; &gt; Using get_unaligned(), patched code would be<br>
&gt; &gt; -----------------------------------------------------<br>
&gt; &gt; regmap_write(rpc-&gt;regmap, RPC_SMWDR0,<br>
&gt; &gt; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;get_unaligned((u32
*)(tx_buf + pos))); &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;<br>
&gt; &gt; ----------------------------------------------------<br>
&gt; <br>
&gt; Do you need the cast if you use get_unaligned() ?</font></tt>
<br>
<br><tt><font size=2>yes!</font></tt>
<br><tt><font size=2><br>
&gt; &gt;&gt; &gt;&gt; &gt; +<br>
&gt; &gt;&gt; &gt;&gt; &gt; +static const struct regmap_range rpc_spi_volatile_ranges[]
= {<br>
&gt; &gt;&gt; &gt;&gt; &gt; + &nbsp; regmap_reg_range(RPC_SMRDR0, RPC_SMRDR0),<br>
&gt; &gt;&gt; &gt;&gt; &gt; + &nbsp; regmap_reg_range(RPC_SMWDR0, RPC_SMWDR0),<br>
&gt; &gt;&gt; &gt;&gt;<br>
&gt; &gt;&gt; &gt;&gt; Why is SMWDR volatile ?<br>
&gt; &gt;&gt; &gt;<br>
&gt; &gt;&gt; &gt; No matter is write-back or write-through.<br>
&gt; &gt;&gt;<br>
&gt; &gt;&gt; Oh, do you want to assure the SMWDR value is always written
directly to<br>
&gt; &gt;&gt; the hardware ?<br>
&gt; &gt; <br>
&gt; &gt; yes,<br>
&gt; &gt; <br>
&gt; &gt;&gt;<br>
&gt; &gt;&gt; btw. I think SMRDR should be precious ?<br>
&gt; &gt; <br>
&gt; &gt; so, you think I should drop<br>
&gt; &gt; regmap_reg_range(RPC_SMWDR0, RPC_SMWDR0)<br>
&gt; <br>
&gt; No, I am asking whether SMRDR should be marked precious or not.<br>
&gt; </font></tt>
<br>
<br><tt><font size=2>I don't think so,</font></tt>
<br><tt><font size=2>precious_reg: the register should not be read outside
of</font></tt>
<br><tt><font size=2>call from driver, i.e,. a clear on read interrupt
status register.</font></tt>
<br>
<br><tt><font size=2><br>
&gt; [...]<br>
&gt; <br>
&gt; &gt; CONFIDENTIALITY NOTE:<br>
&gt; &gt; <br>
&gt; &gt; This e-mail and any attachments may contain confidential information<br>
&gt; &gt; and/or personal data, which is protected by applicable laws.
Please be<br>
&gt; &gt; reminded that duplication, disclosure, distribution, or use of
this<br>
&gt; &gt; e-mail (and/or its attachments) or any part thereof is prohibited.
If<br>
&gt; &gt; you receive this e-mail in error, please notify us immediately
and<br>
&gt; &gt; delete this mail as well as its attachment(s) from your system.
In<br>
&gt; &gt; addition, please be informed that collection, processing, and/or
use of<br>
&gt; &gt; personal data is prohibited unless expressly permitted by personal
data<br>
&gt; &gt; protection laws. Thank you for your attention and cooperation.<br>
&gt; &gt; <br>
&gt; &gt; Macronix International Co., Ltd.<br>
&gt; <br>
&gt; Can you do something about this ^ please ?<br>
&gt; </font></tt>
<br>
<br><tt><font size=2>I submit the patch file is by another remote git-server,
which</font></tt>
<br><tt><font size=2>supports git-format patch, git send-mail and so on.</font></tt>
<br><tt><font size=2>But it can't receive email.</font></tt>
<br>
<br><tt><font size=2>I get/send email are by office PC w/ Notes system
and </font></tt>
<br><tt><font size=2>this &quot;CONFx NOTE:&quot; is appended automatically
by Notes mail-server.</font></tt>
<br>
<br><tt><font size=2>Please just never mind it.</font></tt>
<br>
<br><tt><font size=2>thanks &amp; best regards,</font></tt>
<br><tt><font size=2>Mason<br>
<br>
<br>
<br>
CONFIDENTIALITY NOTE:<br>
<br>
This e-mail and any attachments may contain confidential information and/or
personal data, which is protected by applicable laws. Please be reminded
that duplication, disclosure, distribution, or use of this e-mail (and/or
its attachments) or any part thereof is prohibited. If you receive this
e-mail in error, please notify us immediately and delete this mail as well
as its attachment(s) from your system. In addition, please be informed
that collection, processing, and/or use of personal data is prohibited
unless expressly permitted by personal data protection laws. Thank you
for your attention and cooperation.<br>
<br>
Macronix International Co., Ltd.<br>
<br>
=====================================================================<br>
</font></tt>

--=_alternative 0028B3A14825835C_=--
