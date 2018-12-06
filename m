Return-Path: <masonccyang@mxic.com.tw>
In-Reply-To: <84e3c55b-687e-28f6-0a7c-1c48c822ef05@gmail.com>
References: <1543828720-18345-1-git-send-email-masonccyang@mxic.com.tw> <1543828720-18345-2-git-send-email-masonccyang@mxic.com.tw> <cebe44a3-80be-9091-e70b-acba6f3fff4f@gmail.com> <OF0ED3C578.141B72CA-ON4825835A.0025CA62-4825835A.002A7BDF@mxic.com.tw> <84e3c55b-687e-28f6-0a7c-1c48c822ef05@gmail.com>
To: "Marek Vasut" <marek.vasut@gmail.com>
Cc: boris.brezillon@bootlin.com, broonie@kernel.org,
        "Geert Uytterhoeven"<geert+renesas@glider.be>,
        "Simon Horman" <horms@verge.net.au>, juliensu@mxic.com.tw,
        linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        linux-spi@vger.kernel.org, zhengxunli@mxic.com.tw
Subject: Re: [PATCH v2 1/2] spi: Add Renesas R-Car Gen3 RPC SPI controller driver
MIME-Version: 1.0
Message-ID: <OFC9FB54F8.34B3A8B7-ON4825835B.00267480-4825835B.0029455C@mxic.com.tw>
From: masonccyang@mxic.com.tw
Date: Thu, 6 Dec 2018 15:30:47 +0800
Content-Type: multipart/alternative; boundary="=_alternative 0029455B4825835B_="
List-ID: <linux-renesas-soc.vger.kernel.org>

This is a multipart message in MIME format.
--=_alternative 0029455B4825835B_=
Content-Type: text/plain; charset="US-ASCII"


Hi Marek,

> >> Re: [PATCH v2 1/2] spi: Add Renesas R-Car Gen3 RPC SPI controller 
driver
> >>
> >> On 12/03/2018 10:18 AM, Mason Yang wrote:
> >> > Add a driver for Renesas R-Car Gen3 RPC SPI controller.
> >> >
> >> > Signed-off-by: Mason Yang <masonccyang@mxic.com.tw>
> >>
> >> What changed in this V2 ?
> >>
> >> [...]
> > 
> > see some description in [PATH v2 0/2]
> 
> I don't see any V2: list there.
> 

including 
1) remove RPC clock enable/dis-able control,
2) patch run time PM, 
3) add RPC module software reset, 
4) add regmap,
5) other coding style and so on.


> >> > +static int rpc_spi_io_xfer(struct rpc_spi *rpc,
> >> > +            const void *tx_buf, void *rx_buf)
> >> > +{
> >> > +   u32 smenr, smcr, data, pos = 0;
> >> > +   int ret = 0;
> >> > +
> >> > +   regmap_write(rpc->regmap, RPC_CMNCR, RPC_CMNCR_MD | 
RPC_CMNCR_SFDE |
> >> > +              RPC_CMNCR_MOIIO_HIZ | RPC_CMNCR_IOFV_HIZ |
> >> > +              RPC_CMNCR_BSZ(0));
> >> > +   regmap_write(rpc->regmap, RPC_SMDRENR, 0x0);
> >> > +   regmap_write(rpc->regmap, RPC_SMCMR, rpc->cmd);
> >> > +   regmap_write(rpc->regmap, RPC_SMDMCR, rpc->dummy);
> >> > +   regmap_write(rpc->regmap, RPC_SMADR, rpc->addr);
> >> > +
> >> > +   if (tx_buf) {
> >> > +      smenr = rpc->smenr;
> >> > +
> >> > +      while (pos < rpc->xferlen) {
> >> > +         u32 nbytes = rpc->xferlen  - pos;
> >> > +
> >> > +         regmap_write(rpc->regmap, RPC_SMWDR0,
> >> > +                 *(u32 *)(tx_buf + pos));
> >>
> >> *(u32 *) cast is probably not needed , fix casts globally.
> > 
> > It must have it!
> 
> Why ?

Get a compiler warning due to tx_bug is void *, as Geert replied.

Using get_unaligned(), patched code would be
-----------------------------------------------------
regmap_write(rpc->regmap, RPC_SMWDR0,
                 get_unaligned((u32 *)(tx_buf + pos))); 
----------------------------------------------------


> >> > +         rpc->xferlen = *(u32 *)len;
> >> > +         rpc->totalxferlen += *(u32 *)len;
> >> > +      } else {
> >> > +         rpc->smenr |= RPC_SMENR_SPIDE(rpc_bits_xfer
> >> > +               (op->data.nbytes)) | RPC_SMENR_SPIDB
> >> > +               (fls(op->data.buswidth >> 1));
> >>
> >> Drop parenthesis around fls()
> > 
> > ?
> > no way.
> 
> I would really appreciate it if you could explain things instead.
> 
> Geert already did so, by pointing out this is a confusing code
> formatting problem and how it should be fixed, so no need to repeat
> that. But I hope you understand how that sort of explanation is far more
> valuable than "no way" kind of reply.

okay, understood.


> >> > +
> >> > +   xfercnt = xferpos;
> >> > +   rpc->xferlen = xfer[--xferpos].len;
> >> > +   rpc->cmd = RPC_SMCMR_CMD(((u8 *)xfer[0].tx_buf)[0]);
> >>
> >> Is the cast needed ?
> > 
> > yes!
> 
> Why ?

Get a compiler warning due to tx_bug is void *, as Geert replied.

Using get_unaligned(), patched code would be
---------------------------------------------------------------
 rpc->cmd = RPC_SMCMR_CMD(get_unaligned((u8 *)xfer[0].tx_buf)); 
----------------------------------------------------------------


> 
> >> > +   rpc->smenr = RPC_SMENR_CDE | RPC_SMENR_CDB(fls(xfer[0].tx_nbits
> >>> 1));
> >> > +   rpc->addr = 0;
> >> > +
> >> > +   if (xfercnt > 2 && xfer[1].len && xfer[1].tx_buf) {
> >> > +      rpc->smenr |= RPC_SMENR_ADB(fls(xfer[1].tx_nbits >> 1));
> >> > +      for (i = 0; i < xfer[1].len; i++)
> >> > +         rpc->addr |= (u32)((u8 *)xfer[1].tx_buf)[i]
> >> > +               << (8 * (xfer[1].len - i - 1));
> >> > +
> >> > +      if (xfer[1].len == 4)
> >> > +         rpc->smenr |= RPC_SMENR_ADE(0xf);
> >> > +      else
> >> > +         rpc->smenr |= RPC_SMENR_ADE(0x7);
> >> > +   }
> >> > +
> >> > +   switch (xfercnt) {
> >> > +   case 2:
> >> > +      if (xfer[1].rx_buf) {
> >> > +         rpc->smenr |= RPC_SMENR_SPIDE(rpc_bits_xfer
> >> > +                  (xfer[1].len)) | RPC_SMENR_SPIDB(fls
> >> > +                  (xfer[1].rx_nbits >> 1));
> >> > +      } else if (xfer[1].tx_buf) {
> >> > +         rpc->smenr |= RPC_SMENR_SPIDE(rpc_bits_xfer
> >> > +                  (xfer[1].len)) | RPC_SMENR_SPIDB(fls
> >> > +                  (xfer[1].tx_nbits >> 1));
> >> > +      }
> >> > +      break;
> >> > +
> >> > +   case 3:
> >> > +      if (xfer[2].len && xfer[2].rx_buf && !xfer[2].tx_buf) {
> >> > +         rpc->smenr |= RPC_SMENR_SPIDE(rpc_bits_xfer
> >> > +                  (xfer[2].len)) | RPC_SMENR_SPIDB(fls
> >> > +                  (xfer[2].rx_nbits >> 1));
> >>
> >> It seems this SMENR pattern repeats itself throughout the driver, can
> >> this be improved / deduplicated ?
> > 
> > It seems no way!
> 
> Why ?

okay, I patch this with for( ) loop.

> 
> >> > +      } else if (xfer[2].len && xfer[2].tx_buf && !xfer[2].rx_buf) 
{
> >> > +         rpc->smenr |= RPC_SMENR_SPIDE(rpc_bits_xfer
> >> > +                  (xfer[2].len)) | RPC_SMENR_SPIDB(fls
> >> > +                  (xfer[2].tx_nbits >> 1));
> >> > +      }
> >> > +      break;
> >> > +
> >> > +   case 4:
> >> > +      if (xfer[2].len && xfer[2].tx_buf) {
> >> > +         rpc->smenr |= RPC_SMENR_DME;
> >> > +         rpc->dummy = RPC_SMDMCR_DMCYC(xfer[2].len);
> >> > +      }
> >> > +
> >> > +      if (xfer[3].len && xfer[3].rx_buf) {
> >> > +         rpc->smenr |= RPC_SMENR_SPIDE(rpc_bits_xfer
> >> > +                  (xfer[3].len)) | RPC_SMENR_SPIDB(fls
> >> > +                  (xfer[3].rx_nbits >> 1));
> >> > +      }
> >> > +      break;
> >> > +
> >> > +   default:
> >> > +      break;
> >> > +   }
> >> > +}
> >> > +
> >> > +static int rpc_spi_xfer_message(struct rpc_spi *rpc, struct
> >> spi_transfer *t)
> >> > +{
> >> > +   int ret;
> >> > +
> >> > +   ret = rpc_spi_set_freq(rpc, t->speed_hz);
> >> > +   if (ret)
> >> > +      return ret;
> >> > +
> >> > +   ret = rpc_spi_io_xfer(rpc,
> >> > +               rpc->xfer_dir == SPI_MEM_DATA_OUT ?
> >> > +               t->tx_buf : NULL,
> >> > +               rpc->xfer_dir == SPI_MEM_DATA_IN ?
> >> > +               t->rx_buf : NULL);
> >> > +
> >> > +   return ret;
> >> > +}
> >> > +
> >> > +static int rpc_spi_transfer_one_message(struct spi_master *master,
> >> > +               struct spi_message *msg)
> >> > +{
> >> > +   struct rpc_spi *rpc = spi_master_get_devdata(master);
> >> > +   struct spi_transfer *t;
> >> > +   int ret;
> >> > +
> >> > +   rpc_spi_transfer_setup(rpc, msg);
> >> > +
> >> > +   list_for_each_entry(t, &msg->transfers, transfer_list) {
> >> > +      if (!list_is_last(&t->transfer_list, &msg->transfers))
> >> > +         continue;
> >> > +      ret = rpc_spi_xfer_message(rpc, t);
> >> > +      if (ret)
> >> > +         goto out;
> >> > +   }
> >> > +
> >> > +   msg->status = 0;
> >> > +   msg->actual_length = rpc->totalxferlen;
> >> > +out:
> >> > +   spi_finalize_current_message(master);
> >> > +   return 0;
> >> > +}
> >> > +
> >> > +static const struct regmap_range rpc_spi_volatile_ranges[] = {
> >> > +   regmap_reg_range(RPC_SMRDR0, RPC_SMRDR0),
> >> > +   regmap_reg_range(RPC_SMWDR0, RPC_SMWDR0),
> >>
> >> Why is SMWDR volatile ?
> > 
> > No matter is write-back or write-through.
> 
> Oh, do you want to assure the SMWDR value is always written directly to
> the hardware ?

yes,

> 
> btw. I think SMRDR should be precious ?

so, you think I should drop
regmap_reg_range(RPC_SMWDR0, RPC_SMWDR0)


thanks again for your review.
best regards,
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

--=_alternative 0029455B4825835B_=
Content-Type: text/html; charset="US-ASCII"


<tt><font size=2>Hi Marek,</font></tt>
<br><tt><font size=2><br>
&gt; &gt;&gt; Re: [PATCH v2 1/2] spi: Add Renesas R-Car Gen3 RPC SPI controller
driver<br>
&gt; &gt;&gt;<br>
&gt; &gt;&gt; On 12/03/2018 10:18 AM, Mason Yang wrote:<br>
&gt; &gt;&gt; &gt; Add a driver for Renesas R-Car Gen3 RPC SPI controller.<br>
&gt; &gt;&gt; &gt;<br>
&gt; &gt;&gt; &gt; Signed-off-by: Mason Yang &lt;masonccyang@mxic.com.tw&gt;<br>
&gt; &gt;&gt;<br>
&gt; &gt;&gt; What changed in this V2 ?<br>
&gt; &gt;&gt;<br>
&gt; &gt;&gt; [...]<br>
&gt; &gt; <br>
&gt; &gt; see some description in [PATH v2 0/2]<br>
&gt; <br>
&gt; I don't see any V2: list there.<br>
&gt; <br>
</font></tt>
<br><tt><font size=2>including </font></tt>
<br><tt><font size=2>1) remove RPC clock enable/dis-able control,<br>
2) patch run time PM, </font></tt>
<br><tt><font size=2>3) add RPC module software reset, </font></tt>
<br><tt><font size=2>4) add regmap,</font></tt>
<br><tt><font size=2>5) other coding style and so on.</font></tt>
<br>
<br><tt><font size=2><br>
&gt; &gt;&gt; &gt; +static int rpc_spi_io_xfer(struct rpc_spi *rpc,<br>
&gt; &gt;&gt; &gt; + &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;const void
*tx_buf, void *rx_buf)<br>
&gt; &gt;&gt; &gt; +{<br>
&gt; &gt;&gt; &gt; + &nbsp; u32 smenr, smcr, data, pos = 0;<br>
&gt; &gt;&gt; &gt; + &nbsp; int ret = 0;<br>
&gt; &gt;&gt; &gt; +<br>
&gt; &gt;&gt; &gt; + &nbsp; regmap_write(rpc-&gt;regmap, RPC_CMNCR, RPC_CMNCR_MD
| RPC_CMNCR_SFDE |<br>
&gt; &gt;&gt; &gt; + &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;RPC_CMNCR_MOIIO_HIZ
| RPC_CMNCR_IOFV_HIZ |<br>
&gt; &gt;&gt; &gt; + &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;RPC_CMNCR_BSZ(0));<br>
&gt; &gt;&gt; &gt; + &nbsp; regmap_write(rpc-&gt;regmap, RPC_SMDRENR, 0x0);<br>
&gt; &gt;&gt; &gt; + &nbsp; regmap_write(rpc-&gt;regmap, RPC_SMCMR, rpc-&gt;cmd);<br>
&gt; &gt;&gt; &gt; + &nbsp; regmap_write(rpc-&gt;regmap, RPC_SMDMCR, rpc-&gt;dummy);<br>
&gt; &gt;&gt; &gt; + &nbsp; regmap_write(rpc-&gt;regmap, RPC_SMADR, rpc-&gt;addr);<br>
&gt; &gt;&gt; &gt; +<br>
&gt; &gt;&gt; &gt; + &nbsp; if (tx_buf) {<br>
&gt; &gt;&gt; &gt; + &nbsp; &nbsp; &nbsp;smenr = rpc-&gt;smenr;<br>
&gt; &gt;&gt; &gt; +<br>
&gt; &gt;&gt; &gt; + &nbsp; &nbsp; &nbsp;while (pos &lt; rpc-&gt;xferlen)
{<br>
&gt; &gt;&gt; &gt; + &nbsp; &nbsp; &nbsp; &nbsp; u32 nbytes = rpc-&gt;xferlen
&nbsp;- pos;<br>
&gt; &gt;&gt; &gt; +<br>
&gt; &gt;&gt; &gt; + &nbsp; &nbsp; &nbsp; &nbsp; regmap_write(rpc-&gt;regmap,
RPC_SMWDR0,<br>
&gt; &gt;&gt; &gt; + &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
*(u32 *)(tx_buf + pos));<br>
&gt; &gt;&gt;<br>
&gt; &gt;&gt; *(u32 *) cast is probably not needed , fix casts globally.</font></tt>
<br><tt><font size=2>&gt; &gt; <br>
&gt; &gt; It must have it!<br>
&gt; <br>
&gt; Why ?</font></tt>
<br>
<br><tt><font size=2>Get a compiler warning due to tx_bug is void *, as
Geert replied.</font></tt>
<br>
<br><tt><font size=2>Using get_unaligned(), patched code would be</font></tt>
<br><tt><font size=2>-----------------------------------------------------</font></tt>
<br><tt><font size=2>regmap_write(rpc-&gt;regmap, RPC_SMWDR0,</font></tt>
<br><tt><font size=2>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
&nbsp; &nbsp; &nbsp;get_unaligned((u32 *)(tx_buf + pos))); &nbsp;
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;</font></tt>
<br><tt><font size=2>----------------------------------------------------</font></tt>
<br><tt><font size=2><br>
<br>
&gt; &gt;&gt; &gt; + &nbsp; &nbsp; &nbsp; &nbsp; rpc-&gt;xferlen = *(u32
*)len;<br>
&gt; &gt;&gt; &gt; + &nbsp; &nbsp; &nbsp; &nbsp; rpc-&gt;totalxferlen +=
*(u32 *)len;<br>
&gt; &gt;&gt; &gt; + &nbsp; &nbsp; &nbsp;} else {<br>
&gt; &gt;&gt; &gt; + &nbsp; &nbsp; &nbsp; &nbsp; rpc-&gt;smenr |= RPC_SMENR_SPIDE(rpc_bits_xfer<br>
&gt; &gt;&gt; &gt; + &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; (op-&gt;data.nbytes))
| RPC_SMENR_SPIDB<br>
&gt; &gt;&gt; &gt; + &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; (fls(op-&gt;data.buswidth
&gt;&gt; 1));<br>
&gt; &gt;&gt;<br>
&gt; &gt;&gt; Drop parenthesis around fls()<br>
&gt; &gt; <br>
&gt; &gt; ?<br>
&gt; &gt; no way.<br>
&gt; <br>
&gt; I would really appreciate it if you could explain things instead.<br>
&gt; <br>
&gt; Geert already did so, by pointing out this is a confusing code<br>
&gt; formatting problem and how it should be fixed, so no need to repeat<br>
&gt; that. But I hope you understand how that sort of explanation is far
more<br>
&gt; valuable than &quot;no way&quot; kind of reply.</font></tt>
<br>
<br><tt><font size=2>okay, understood.</font></tt>
<br><tt><font size=2><br>
<br>
&gt; &gt;&gt; &gt; +<br>
&gt; &gt;&gt; &gt; + &nbsp; xfercnt = xferpos;<br>
&gt; &gt;&gt; &gt; + &nbsp; rpc-&gt;xferlen = xfer[--xferpos].len;<br>
&gt; &gt;&gt; &gt; + &nbsp; rpc-&gt;cmd = RPC_SMCMR_CMD(((u8 *)xfer[0].tx_buf)[0]);<br>
&gt; &gt;&gt;<br>
&gt; &gt;&gt; Is the cast needed ?<br>
&gt; &gt; <br>
&gt; &gt; yes!<br>
&gt; <br>
&gt; Why ?</font></tt>
<br>
<br><tt><font size=2>Get a compiler warning due to tx_bug is void *, as
Geert replied.</font></tt>
<br>
<br><tt><font size=2>Using get_unaligned(), patched code would be</font></tt>
<br><tt><font size=2>---------------------------------------------------------------</font></tt>
<br><tt><font size=2>&nbsp;rpc-&gt;cmd = RPC_SMCMR_CMD(get_unaligned((u8
*)xfer[0].tx_buf)); </font></tt>
<br><tt><font size=2>----------------------------------------------------------------</font></tt>
<br>
<br><tt><font size=2><br>
&gt; <br>
&gt; &gt;&gt; &gt; + &nbsp; rpc-&gt;smenr = RPC_SMENR_CDE | RPC_SMENR_CDB(fls(xfer[0].tx_nbits<br>
&gt; &gt;&gt;&gt; 1));<br>
&gt; &gt;&gt; &gt; + &nbsp; rpc-&gt;addr = 0;<br>
&gt; &gt;&gt; &gt; +<br>
&gt; &gt;&gt; &gt; + &nbsp; if (xfercnt &gt; 2 &amp;&amp; xfer[1].len &amp;&amp;
xfer[1].tx_buf) {<br>
&gt; &gt;&gt; &gt; + &nbsp; &nbsp; &nbsp;rpc-&gt;smenr |= RPC_SMENR_ADB(fls(xfer[1].tx_nbits
&gt;&gt; 1));<br>
&gt; &gt;&gt; &gt; + &nbsp; &nbsp; &nbsp;for (i = 0; i &lt; xfer[1].len;
i++)<br>
&gt; &gt;&gt; &gt; + &nbsp; &nbsp; &nbsp; &nbsp; rpc-&gt;addr |= (u32)((u8
*)xfer[1].tx_buf)[i]<br>
&gt; &gt;&gt; &gt; + &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &lt;&lt;
(8 * (xfer[1].len - i - 1));<br>
&gt; &gt;&gt; &gt; +<br>
&gt; &gt;&gt; &gt; + &nbsp; &nbsp; &nbsp;if (xfer[1].len == 4)<br>
&gt; &gt;&gt; &gt; + &nbsp; &nbsp; &nbsp; &nbsp; rpc-&gt;smenr |= RPC_SMENR_ADE(0xf);<br>
&gt; &gt;&gt; &gt; + &nbsp; &nbsp; &nbsp;else<br>
&gt; &gt;&gt; &gt; + &nbsp; &nbsp; &nbsp; &nbsp; rpc-&gt;smenr |= RPC_SMENR_ADE(0x7);<br>
&gt; &gt;&gt; &gt; + &nbsp; }<br>
&gt; &gt;&gt; &gt; +<br>
&gt; &gt;&gt; &gt; + &nbsp; switch (xfercnt) {<br>
&gt; &gt;&gt; &gt; + &nbsp; case 2:<br>
&gt; &gt;&gt; &gt; + &nbsp; &nbsp; &nbsp;if (xfer[1].rx_buf) {<br>
&gt; &gt;&gt; &gt; + &nbsp; &nbsp; &nbsp; &nbsp; rpc-&gt;smenr |= RPC_SMENR_SPIDE(rpc_bits_xfer<br>
&gt; &gt;&gt; &gt; + &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
&nbsp;(xfer[1].len)) | RPC_SMENR_SPIDB(fls<br>
&gt; &gt;&gt; &gt; + &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
&nbsp;(xfer[1].rx_nbits &gt;&gt; 1));<br>
&gt; &gt;&gt; &gt; + &nbsp; &nbsp; &nbsp;} else if (xfer[1].tx_buf) {<br>
&gt; &gt;&gt; &gt; + &nbsp; &nbsp; &nbsp; &nbsp; rpc-&gt;smenr |= RPC_SMENR_SPIDE(rpc_bits_xfer<br>
&gt; &gt;&gt; &gt; + &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
&nbsp;(xfer[1].len)) | RPC_SMENR_SPIDB(fls<br>
&gt; &gt;&gt; &gt; + &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
&nbsp;(xfer[1].tx_nbits &gt;&gt; 1));<br>
&gt; &gt;&gt; &gt; + &nbsp; &nbsp; &nbsp;}<br>
&gt; &gt;&gt; &gt; + &nbsp; &nbsp; &nbsp;break;<br>
&gt; &gt;&gt; &gt; +<br>
&gt; &gt;&gt; &gt; + &nbsp; case 3:<br>
&gt; &gt;&gt; &gt; + &nbsp; &nbsp; &nbsp;if (xfer[2].len &amp;&amp; xfer[2].rx_buf
&amp;&amp; !xfer[2].tx_buf) {<br>
&gt; &gt;&gt; &gt; + &nbsp; &nbsp; &nbsp; &nbsp; rpc-&gt;smenr |= RPC_SMENR_SPIDE(rpc_bits_xfer<br>
&gt; &gt;&gt; &gt; + &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
&nbsp;(xfer[2].len)) | RPC_SMENR_SPIDB(fls<br>
&gt; &gt;&gt; &gt; + &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
&nbsp;(xfer[2].rx_nbits &gt;&gt; 1));<br>
&gt; &gt;&gt;<br>
&gt; &gt;&gt; It seems this SMENR pattern repeats itself throughout the
driver, can<br>
&gt; &gt;&gt; this be improved / deduplicated ?<br>
&gt; &gt; <br>
&gt; &gt; It seems no way!<br>
&gt; <br>
&gt; Why ?</font></tt>
<br>
<br><tt><font size=2>okay, I patch this with for( ) loop.</font></tt>
<br><tt><font size=2><br>
&gt; <br>
&gt; &gt;&gt; &gt; + &nbsp; &nbsp; &nbsp;} else if (xfer[2].len &amp;&amp;
xfer[2].tx_buf &amp;&amp; !xfer[2].rx_buf) {<br>
&gt; &gt;&gt; &gt; + &nbsp; &nbsp; &nbsp; &nbsp; rpc-&gt;smenr |= RPC_SMENR_SPIDE(rpc_bits_xfer<br>
&gt; &gt;&gt; &gt; + &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
&nbsp;(xfer[2].len)) | RPC_SMENR_SPIDB(fls<br>
&gt; &gt;&gt; &gt; + &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
&nbsp;(xfer[2].tx_nbits &gt;&gt; 1));<br>
&gt; &gt;&gt; &gt; + &nbsp; &nbsp; &nbsp;}<br>
&gt; &gt;&gt; &gt; + &nbsp; &nbsp; &nbsp;break;<br>
&gt; &gt;&gt; &gt; +<br>
&gt; &gt;&gt; &gt; + &nbsp; case 4:<br>
&gt; &gt;&gt; &gt; + &nbsp; &nbsp; &nbsp;if (xfer[2].len &amp;&amp; xfer[2].tx_buf)
{<br>
&gt; &gt;&gt; &gt; + &nbsp; &nbsp; &nbsp; &nbsp; rpc-&gt;smenr |= RPC_SMENR_DME;<br>
&gt; &gt;&gt; &gt; + &nbsp; &nbsp; &nbsp; &nbsp; rpc-&gt;dummy = RPC_SMDMCR_DMCYC(xfer[2].len);<br>
&gt; &gt;&gt; &gt; + &nbsp; &nbsp; &nbsp;}<br>
&gt; &gt;&gt; &gt; +<br>
&gt; &gt;&gt; &gt; + &nbsp; &nbsp; &nbsp;if (xfer[3].len &amp;&amp; xfer[3].rx_buf)
{<br>
&gt; &gt;&gt; &gt; + &nbsp; &nbsp; &nbsp; &nbsp; rpc-&gt;smenr |= RPC_SMENR_SPIDE(rpc_bits_xfer<br>
&gt; &gt;&gt; &gt; + &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
&nbsp;(xfer[3].len)) | RPC_SMENR_SPIDB(fls<br>
&gt; &gt;&gt; &gt; + &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
&nbsp;(xfer[3].rx_nbits &gt;&gt; 1));<br>
&gt; &gt;&gt; &gt; + &nbsp; &nbsp; &nbsp;}<br>
&gt; &gt;&gt; &gt; + &nbsp; &nbsp; &nbsp;break;<br>
&gt; &gt;&gt; &gt; +<br>
&gt; &gt;&gt; &gt; + &nbsp; default:<br>
&gt; &gt;&gt; &gt; + &nbsp; &nbsp; &nbsp;break;<br>
&gt; &gt;&gt; &gt; + &nbsp; }<br>
&gt; &gt;&gt; &gt; +}<br>
&gt; &gt;&gt; &gt; +<br>
&gt; &gt;&gt; &gt; +static int rpc_spi_xfer_message(struct rpc_spi *rpc,
struct<br>
&gt; &gt;&gt; spi_transfer *t)<br>
&gt; &gt;&gt; &gt; +{<br>
&gt; &gt;&gt; &gt; + &nbsp; int ret;</font></tt>
<br><tt><font size=2>&gt; &gt;&gt; &gt; +<br>
&gt; &gt;&gt; &gt; + &nbsp; ret = rpc_spi_set_freq(rpc, t-&gt;speed_hz);<br>
&gt; &gt;&gt; &gt; + &nbsp; if (ret)<br>
&gt; &gt;&gt; &gt; + &nbsp; &nbsp; &nbsp;return ret;<br>
&gt; &gt;&gt; &gt; +<br>
&gt; &gt;&gt; &gt; + &nbsp; ret = rpc_spi_io_xfer(rpc,<br>
&gt; &gt;&gt; &gt; + &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; rpc-&gt;xfer_dir
== SPI_MEM_DATA_OUT ?<br>
&gt; &gt;&gt; &gt; + &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; t-&gt;tx_buf
: NULL,<br>
&gt; &gt;&gt; &gt; + &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; rpc-&gt;xfer_dir
== SPI_MEM_DATA_IN ?<br>
&gt; &gt;&gt; &gt; + &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; t-&gt;rx_buf
: NULL);<br>
&gt; &gt;&gt; &gt; +<br>
&gt; &gt;&gt; &gt; + &nbsp; return ret;<br>
&gt; &gt;&gt; &gt; +}<br>
&gt; &gt;&gt; &gt; +<br>
&gt; &gt;&gt; &gt; +static int rpc_spi_transfer_one_message(struct spi_master
*master,<br>
&gt; &gt;&gt; &gt; + &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; struct
spi_message *msg)<br>
&gt; &gt;&gt; &gt; +{<br>
&gt; &gt;&gt; &gt; + &nbsp; struct rpc_spi *rpc = spi_master_get_devdata(master);<br>
&gt; &gt;&gt; &gt; + &nbsp; struct spi_transfer *t;<br>
&gt; &gt;&gt; &gt; + &nbsp; int ret;<br>
&gt; &gt;&gt; &gt; +<br>
&gt; &gt;&gt; &gt; + &nbsp; rpc_spi_transfer_setup(rpc, msg);<br>
&gt; &gt;&gt; &gt; +<br>
&gt; &gt;&gt; &gt; + &nbsp; list_for_each_entry(t, &amp;msg-&gt;transfers,
transfer_list) {<br>
&gt; &gt;&gt; &gt; + &nbsp; &nbsp; &nbsp;if (!list_is_last(&amp;t-&gt;transfer_list,
&amp;msg-&gt;transfers))<br>
&gt; &gt;&gt; &gt; + &nbsp; &nbsp; &nbsp; &nbsp; continue;<br>
&gt; &gt;&gt; &gt; + &nbsp; &nbsp; &nbsp;ret = rpc_spi_xfer_message(rpc,
t);<br>
&gt; &gt;&gt; &gt; + &nbsp; &nbsp; &nbsp;if (ret)<br>
&gt; &gt;&gt; &gt; + &nbsp; &nbsp; &nbsp; &nbsp; goto out;<br>
&gt; &gt;&gt; &gt; + &nbsp; }<br>
&gt; &gt;&gt; &gt; +<br>
&gt; &gt;&gt; &gt; + &nbsp; msg-&gt;status = 0;<br>
&gt; &gt;&gt; &gt; + &nbsp; msg-&gt;actual_length = rpc-&gt;totalxferlen;<br>
&gt; &gt;&gt; &gt; +out:<br>
&gt; &gt;&gt; &gt; + &nbsp; spi_finalize_current_message(master);<br>
&gt; &gt;&gt; &gt; + &nbsp; return 0;<br>
&gt; &gt;&gt; &gt; +}<br>
&gt; &gt;&gt; &gt; +<br>
&gt; &gt;&gt; &gt; +static const struct regmap_range rpc_spi_volatile_ranges[]
= {<br>
&gt; &gt;&gt; &gt; + &nbsp; regmap_reg_range(RPC_SMRDR0, RPC_SMRDR0),<br>
&gt; &gt;&gt; &gt; + &nbsp; regmap_reg_range(RPC_SMWDR0, RPC_SMWDR0),<br>
&gt; &gt;&gt;<br>
&gt; &gt;&gt; Why is SMWDR volatile ?<br>
&gt; &gt; <br>
&gt; &gt; No matter is write-back or write-through.<br>
&gt; <br>
&gt; Oh, do you want to assure the SMWDR value is always written directly
to<br>
&gt; the hardware ?</font></tt>
<br>
<br><tt><font size=2>yes,</font></tt>
<br><tt><font size=2><br>
&gt; <br>
&gt; btw. I think SMRDR should be precious ?</font></tt>
<br>
<br><tt><font size=2>so, you think I should drop</font></tt>
<br><tt><font size=2>regmap_reg_range(RPC_SMWDR0, RPC_SMWDR0)</font></tt>
<br>
<br><tt><font size=2><br>
thanks again for your review.</font></tt>
<br><tt><font size=2>best regards,</font></tt>
<br><tt><font size=2>Mason<br>
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

--=_alternative 0029455B4825835B_=--
