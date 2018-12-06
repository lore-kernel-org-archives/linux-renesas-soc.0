Return-Path: <masonccyang@mxic.com.tw>
In-Reply-To: <2c6c23fc-299a-f64d-c81f-4b4123f1577b@gmail.com>
References: <1543828720-18345-1-git-send-email-masonccyang@mxic.com.tw> <1543828720-18345-2-git-send-email-masonccyang@mxic.com.tw> <CAMuHMdWEiOTSSM=rKu67r-kgJ=TyAi7p7ndhAS4d5-6gccmmoQ@mail.gmail.com> <OFE69673FB.D4270C56-ON4825835B.001C7201-4825835B.00209DC7@mxic.com.tw> <2c6c23fc-299a-f64d-c81f-4b4123f1577b@gmail.com>
To: "Marek Vasut" <marek.vasut@gmail.com>
Cc: "Boris Brezillon" <boris.brezillon@bootlin.com>,
        "Mark Brown" <broonie@kernel.org>,
        "Geert Uytterhoeven" <geert@linux-m68k.org>,
        "Geert Uytterhoeven"<geert+renesas@glider.be>,
        "Simon Horman" <horms@verge.net.au>, juliensu@mxic.com.tw,
        "Linux Kernel Mailing List" <linux-kernel@vger.kernel.org>,
        "Linux-Renesas" <linux-renesas-soc@vger.kernel.org>,
        "linux-spi" <linux-spi@vger.kernel.org>, zhengxunli@mxic.com.tw
Subject: Re: [PATCH v2 1/2] spi: Add Renesas R-Car Gen3 RPC SPI controller driver
MIME-Version: 1.0
Message-ID: <OF62002C8B.5D0A4315-ON4825835B.0031F545-4825835B.003310A3@mxic.com.tw>
From: masonccyang@mxic.com.tw
Date: Thu, 6 Dec 2018 17:17:45 +0800
Content-Type: multipart/alternative; boundary="=_alternative 003310A24825835B_="
List-ID: <linux-renesas-soc.vger.kernel.org>

This is a multipart message in MIME format.
--=_alternative 003310A24825835B_=
Content-Type: text/plain; charset="US-ASCII"


Hi Marek,

> >> > +
> >> > +       pm_runtime_enable(&pdev->dev);
> >> > +       master->auto_runtime_pm = true;
> >> > +
> >> > +       master->num_chipselect = 1;
> >> > +       master->mem_ops = &rpc_spi_mem_ops;
> >> > +       master->transfer_one_message = 
rpc_spi_transfer_one_message;
> >>
> >> Is there any reason you cannot use the standard
> >> spi_transfer_one_message, i.e. provide spi_controller.transfer_one()
> >> instead of spi_controller.transfer_one_message()?
> >>
> > 
> > It seems there is a RPC HW restriction in CS# pin control.
> > Therefore, it can't send the 1'st spi-transfer for command and then
> > keeping CS# pin goes low for the 2'nd spi-transfer for address/data 
and
> > so on.
> 
> Isn't register DRCR bit SSLN/SSLE exactly for this purpose ?
> 

DRCR is for RPC module works in external space read mode, using memcpy( ).
It is not for _spi_sync().

I only could use manual I/O mode by SMCR@bit-8 SSLKP and I found it has 
some 
restrictions in manual I/O mode to control CS# pin.


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

--=_alternative 003310A24825835B_=
Content-Type: text/html; charset="US-ASCII"


<tt><font size=2>Hi Marek,</font></tt>
<br>
<br><tt><font size=2>&gt; &gt;&gt; &gt; +<br>
&gt; &gt;&gt; &gt; + &nbsp; &nbsp; &nbsp; pm_runtime_enable(&amp;pdev-&gt;dev);<br>
&gt; &gt;&gt; &gt; + &nbsp; &nbsp; &nbsp; master-&gt;auto_runtime_pm =
true;<br>
&gt; &gt;&gt; &gt; +<br>
&gt; &gt;&gt; &gt; + &nbsp; &nbsp; &nbsp; master-&gt;num_chipselect = 1;<br>
&gt; &gt;&gt; &gt; + &nbsp; &nbsp; &nbsp; master-&gt;mem_ops = &amp;rpc_spi_mem_ops;<br>
&gt; &gt;&gt; &gt; + &nbsp; &nbsp; &nbsp; master-&gt;transfer_one_message
= rpc_spi_transfer_one_message;<br>
&gt; &gt;&gt;<br>
&gt; &gt;&gt; Is there any reason you cannot use the standard<br>
&gt; &gt;&gt; spi_transfer_one_message, i.e. provide spi_controller.transfer_one()<br>
&gt; &gt;&gt; instead of spi_controller.transfer_one_message()?<br>
&gt; &gt;&gt;<br>
&gt; &gt; <br>
&gt; &gt; It seems there is a RPC HW restriction in CS# pin control.<br>
&gt; &gt; Therefore, it can't send the 1'st spi-transfer for command and
then<br>
&gt; &gt; keeping CS# pin goes low for the 2'nd spi-transfer for address/data
and<br>
&gt; &gt; so on.<br>
&gt; <br>
&gt; Isn't register DRCR bit SSLN/SSLE exactly for this purpose ?<br>
&gt; </font></tt>
<br>
<br><tt><font size=2>DRCR is for RPC module works in external space read
mode, using memcpy( ).</font></tt>
<br><tt><font size=2>It is not for _spi_sync().</font></tt>
<br>
<br><tt><font size=2>I only could use manual I/O mode by SMCR@bit-8 SSLKP
and I found it has some </font></tt>
<br><tt><font size=2>restrictions in manual I/O mode to control CS# pin.</font></tt>
<br><tt><font size=2><br>
</font></tt>
<br><tt><font size=2>thanks &amp; best regards,</font></tt>
<br><tt><font size=2>Mason<br>
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

--=_alternative 003310A24825835B_=--
