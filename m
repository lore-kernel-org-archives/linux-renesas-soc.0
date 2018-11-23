Return-Path: <masonccyang@mxic.com.tw>
In-Reply-To: <0223f43b-c6a6-eade-49af-4e7b7ef7f022@gmail.com>
References: <1542621690-10229-1-git-send-email-masonccyang@mxic.com.tw> <1542621690-10229-2-git-send-email-masonccyang@mxic.com.tw> <0223f43b-c6a6-eade-49af-4e7b7ef7f022@gmail.com>
To: Marek Vasut <marek.vasut@gmail.com>
Cc: boris.brezillon@bootlin.com, broonie@kernel.org,
        Geert Uytterhoeven<geert+renesas@glider.be>,
        Simon Horman <horms@verge.net.au>, juliensu@mxic.com.tw,
        linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        linux-spi@vger.kernel.org, tpiepho@impinj.com, zhengxunli@mxic.com.tw
Subject: Re: [PATCH 1/2] spi: Add Renesas R-Car RPC SPI controller driver
MIME-Version: 1.0
Message-ID: <OF5B1A3AE4.2DEECF37-ON4825834E.00031E97-4825834E.00042D72@mxic.com.tw>
From: masonccyang@mxic.com.tw
Date: Fri, 23 Nov 2018 08:45:37 +0800
Content-Type: multipart/alternative; boundary="=_alternative 00042D704825834E_="
List-ID: <linux-renesas-soc.vger.kernel.org>

This is a multipart message in MIME format.
--=_alternative 00042D704825834E_=
Content-Type: text/plain; charset="US-ASCII"


Hi Marek, 


> > +
> > +struct rpc_spi {
> > +   struct clk *clk_rpc;
> > +   void __iomem *regs;
> > +   struct {
> > +      void __iomem *map;
> > +      dma_addr_t dma;
> > +      size_t size;
> > +   } linear;
> 
> Does this need it's own struct ?
> 

yup, I think it's better.
In case no "dirmap" in dtb and no direct mapping mode implemented.


> > +   u32 cur_speed_hz;
> > +   u32 cmd;
> > +   u32 addr;
> > +   u32 dummy;
> > +   u32 smcr;
> > +   u32 smenr;
> > +   u32 xferlen;
> > +   u32 totalxferlen;
> 
> This register cache might be a good candidate for regmap ?

I don't know what does it mean ?
Could you give me more information!

> 
> > +   enum spi_mem_data_dir xfer_dir;
> > +};
> > +
> > +static int rpc_spi_set_freq(struct rpc_spi *rpc, unsigned long freq)
> > +{
> > +   int ret;
> > +
> > +   if (rpc->cur_speed_hz == freq)
> > +      return 0;
> > +
> > +   clk_disable_unprepare(rpc->clk_rpc);
> > +   ret = clk_set_rate(rpc->clk_rpc, freq);
> > +   if (ret)
> > +      return ret;
> > +
> > +   ret = clk_prepare_enable(rpc->clk_rpc);
> > +   if (ret)
> > +      return ret;
> 
> Is this clock disable/update/enable really needed ? I'd think that
> clk_set_rate() would handle the rate update correctly.

As Gerrt mentioned, I will remove them.


> > +static int wait_msg_xfer_end(struct rpc_spi *rpc)
> > +{
> > +   u32 sts;
> > +
> > +   return readl_poll_timeout(rpc->regs + RPC_CMNSR, sts,
> > +              sts & RPC_CMNSR_TEND, 0, USEC_PER_SEC);
> > +}
> > +
> > +static u8 rpc_bits_xfer(u32 nbytes)
> > +{
> > +   u8 databyte;
> > +
> > +   switch (nbytes) {
> 
> Did you ever test unaligned writes and reads ? There are some nasty edge
> cases in those.
> 
> Also, I think you can calculate the number of set bits using a simple
> function, so the switch-case might not even be needed.
> 

Any example function ?

> > +   case 1:
> > +      databyte = 0x8;
> > +      break;
> > +   case 2:
> > +      databyte = 0xc;
> > +      break;
> > +   default:
> > +      databyte = 0xf;
> > +      break;
> > +   }
> > +
> > +   return databyte;
> > +}
> > +
> > +static int rpc_spi_io_xfer(struct rpc_spi *rpc,
> > +            const void *tx_buf, void *rx_buf)
> > +{
> > +   u32 smenr, smcr, data, pos = 0;
> > +   int ret = 0;
> > +
> > +   writel(RPC_CMNCR_MD | RPC_CMNCR_SFDE | RPC_CMNCR_MOIIO_HIZ |
> > +          RPC_CMNCR_IOFV_HIZ | RPC_CMNCR_BSZ(0), rpc->regs + 
RPC_CMNCR);
> > +   writel(0x0, rpc->regs + RPC_SMDRENR);
> > +
> > +   if (tx_buf) {
> > +      writel(rpc->cmd, rpc->regs + RPC_SMCMR);
> > +      writel(rpc->dummy, rpc->regs + RPC_SMDMCR);
> > +      writel(rpc->addr, rpc->regs + RPC_SMADR);
> > +      smenr = rpc->smenr;
> > +
> > +      while (pos < rpc->xferlen) {
> > +         u32 nbytes = rpc->xferlen  - pos;
> > +
> > +         writel(*(u32 *)(tx_buf + pos), rpc->regs + RPC_SMWDR0);
> > +
> > +         if (nbytes > 4) {
> > +            nbytes = 4;
> > +            smcr = rpc->smcr |
> > +                   RPC_SMCR_SPIE | RPC_SMCR_SSLKP;
> > +         } else {
> > +            smcr = rpc->smcr | RPC_SMCR_SPIE;
> > +         }
> > +
> > +         writel(smenr, rpc->regs + RPC_SMENR);
> > +         writel(smcr, rpc->regs + RPC_SMCR);
> > +         ret = wait_msg_xfer_end(rpc);
> > +         if (ret)
> > +            goto out;
> > +
> > +         pos += nbytes;
> > +         smenr = rpc->smenr & ~RPC_SMENR_CDE &
> > +                    ~RPC_SMENR_ADE(0xf);
> > +      }
> > +   } else if (rx_buf) {
> > +      while (pos < rpc->xferlen) {
> > +         u32 nbytes = rpc->xferlen  - pos;
> > +
> > +         if (nbytes > 4)
> > +            nbytes = 4;
> > +
> > +         writel(rpc->cmd, rpc->regs + RPC_SMCMR);
> > +         writel(rpc->dummy, rpc->regs + RPC_SMDMCR);
> > +         writel(rpc->addr + pos, rpc->regs + RPC_SMADR);
> > +         writel(rpc->smenr, rpc->regs + RPC_SMENR);
> > +         writel(rpc->smcr | RPC_SMCR_SPIE, rpc->regs + RPC_SMCR);
> > +         ret = wait_msg_xfer_end(rpc);
> > +         if (ret)
> > +            goto out;
> > +
> > +         data = readl(rpc->regs + RPC_SMRDR0);
> > +         memcpy_fromio(rx_buf + pos, (void *)&data, nbytes);
> > +         pos += nbytes;
> > +      }
> > +   } else {
> > +      writel(rpc->cmd, rpc->regs + RPC_SMCMR);
> > +      writel(rpc->dummy, rpc->regs + RPC_SMDMCR);
> > +      writel(rpc->addr + pos, rpc->regs + RPC_SMADR);
> > +      writel(rpc->smenr, rpc->regs + RPC_SMENR);
> > +      writel(rpc->smcr | RPC_SMCR_SPIE, rpc->regs + RPC_SMCR);
> > +      ret = wait_msg_xfer_end(rpc);
> > +   }
> > +out:
> 
> Dont you need to stop the RPC somehow in case the transmission fails ?
> 

I can't find any RPC registers can do this !

Do you know how to do this ?



> > +   writel(rpc->cmd, rpc->regs + RPC_SMCMR);
> > +   writel(offs, rpc->regs + RPC_SMADR);
> > +   writel(rpc->smenr, rpc->regs + RPC_SMENR);
> > +   writel(rpc->smcr | RPC_SMCR_SPIE, rpc->regs + RPC_SMCR);
> > +   ret = wait_msg_xfer_end(rpc);
> > +   if (ret)
> > +      goto out;
> > +
> > +   writel(RPC_DRCR_RCF, rpc->regs + RPC_DRCR);
> > +   writel(RPC_PHYCNT_CAL | RPC_PHYCNT_STRTIM(0) | 0x260,
> > +          rpc->regs + RPC_PHYCNT);
> > +
> > +   return len;
> > +out:
> 
> Shouldn't you shut the controller down if the xfer fails ?

Any registers can shut down RPC controller ? 
SW reset ? 


> 
> > +   return ret;
> > +}
> > +
> > +static int rpc_spi_mem_dirmap_create(struct spi_mem_dirmap_desc 
*desc)
> > +{
> > +   struct rpc_spi *rpc = 
spi_master_get_devdata(desc->mem->spi->master);
> > +
> > +   if (desc->info.offset + desc->info.length > U32_MAX)
> > +      return -ENOTSUPP;
> > +
> > +   if (!rpc_spi_mem_supports_op(desc->mem, &desc->info.op_tmpl))
> > +      return -ENOTSUPP;
> > +
> > +   if (!rpc->linear.map &&
> > +       desc->info.op_tmpl.data.dir == SPI_MEM_DATA_IN)
> > +      return -ENOTSUPP;
> > +
> > +   return 0;
> > +}
> > +
> > +static int rpc_spi_mem_exec_op(struct spi_mem *mem,
> > +                const struct spi_mem_op *op)
> > +{
> > +   struct rpc_spi *rpc = spi_master_get_devdata(mem->spi->master);
> > +   int ret;
> > +
> > +   ret = rpc_spi_set_freq(rpc, mem->spi->max_speed_hz);
> > +   if (ret)
> > +      return ret;
> > +
> > +   rpc_spi_mem_set_prep_op_cfg(mem->spi, op, NULL, NULL);
> > +
> > +   ret = rpc_spi_io_xfer(rpc,
> > +               op->data.dir == SPI_MEM_DATA_OUT ?
> > +               op->data.buf.out : NULL,
> > +               op->data.dir == SPI_MEM_DATA_IN ?
> > +               op->data.buf.in : NULL);
> > +
> > +   return ret;
> > +}
> > +
> > +static const struct spi_controller_mem_ops rpc_spi_mem_ops = {
> > +   .supports_op = rpc_spi_mem_supports_op,
> > +   .exec_op = rpc_spi_mem_exec_op,
> > +   .dirmap_create = rpc_spi_mem_dirmap_create,
> > +   .dirmap_read = rpc_spi_mem_dirmap_read,
> > +   .dirmap_write = rpc_spi_mem_dirmap_write,
> > +};
> > +
> > +static void rpc_spi_transfer_setup(struct rpc_spi *rpc,
> > +               struct spi_message *msg)
> > +{
> > +   struct spi_transfer *t, xfer[4] = { };
> > +   u32 i, xfercnt, xferpos = 0;
> > +
> > +   rpc->totalxferlen = 0;
> > +   list_for_each_entry(t, &msg->transfers, transfer_list) {
> > +      if (t->tx_buf) {
> > +         xfer[xferpos].tx_buf = t->tx_buf;
> > +         xfer[xferpos].tx_nbits = t->tx_nbits;
> > +      }
> > +
> > +      if (t->rx_buf) {
> > +         xfer[xferpos].rx_buf = t->rx_buf;
> > +         xfer[xferpos].rx_nbits = t->rx_nbits;
> > +      }
> > +
> > +      if (t->len) {
> > +         xfer[xferpos++].len = t->len;
> > +         rpc->totalxferlen += t->len;
> > +      }
> > +   }
> > +
> > +   xfercnt = xferpos;
> > +   rpc->xferlen = xfer[--xferpos].len;
> > +   rpc->cmd = RPC_SMCMR_CMD(((u8 *)xfer[0].tx_buf)[0]);
> 
> Is the cast needed ?

? 

> 
> > +   rpc->smenr = RPC_SMENR_CDE | RPC_SMENR_CDB(fls(xfer[0].tx_nbits >> 
1));
> > +   rpc->addr = 0;
> > +
> > +   if (xfercnt > 2 && xfer[1].len && xfer[1].tx_buf) {
> > +      rpc->smenr |= RPC_SMENR_ADB(fls(xfer[1].tx_nbits >> 1));
> > +      for (i = 0; i < xfer[1].len; i++)
> > +         rpc->addr |= (u32)((u8 *)xfer[1].tx_buf)[i]
> > +               << (8 * (xfer[1].len - i - 1));
> > +
> > +      if (xfer[1].len == 4)
> > +         rpc->smenr |= RPC_SMENR_ADE(0xf);
> > +      else
> > +         rpc->smenr |= RPC_SMENR_ADE(0x7);
> > +   }
> > +
> > +   switch (xfercnt) {
> > +   case 2:
> > +      if (xfer[1].rx_buf) {
> > +         rpc->smenr |= RPC_SMENR_SPIDE(rpc_bits_xfer
> > +                  (xfer[1].len)) | RPC_SMENR_SPIDB(fls
> > +                  (xfer[1].rx_nbits >> 1));
> 
> How much of this register value calculation could be somehow
> deduplicated ? It seems to be almost the same thing copied thrice here.

I don't get your point!

The 2'nd transfer may be 
1) spi-address 
2) tx_buf[] for write registers.
3) rx_buf[] for read status.

parse them and write to rpc->addr and so on.
Or you have a better way to do this ?


thanks again for your review & help.

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

--=_alternative 00042D704825834E_=
Content-Type: text/html; charset="US-ASCII"


<tt><font size=2>Hi Marek, </font></tt>
<br>
<br><tt><font size=2><br>
&gt; &gt; +<br>
&gt; &gt; +struct rpc_spi {<br>
&gt; &gt; + &nbsp; struct clk *clk_rpc;<br>
&gt; &gt; + &nbsp; void __iomem *regs;<br>
&gt; &gt; + &nbsp; struct {<br>
&gt; &gt; + &nbsp; &nbsp; &nbsp;void __iomem *map;<br>
&gt; &gt; + &nbsp; &nbsp; &nbsp;dma_addr_t dma;<br>
&gt; &gt; + &nbsp; &nbsp; &nbsp;size_t size;<br>
&gt; &gt; + &nbsp; } linear;<br>
&gt; <br>
&gt; Does this need it's own struct ?<br>
&gt; </font></tt>
<br>
<br><tt><font size=2>yup, I think it's better.</font></tt>
<br><tt><font size=2>In case no &quot;dirmap&quot; in dtb and no direct
mapping mode implemented.</font></tt>
<br>
<br><tt><font size=2><br>
&gt; &gt; + &nbsp; u32 cur_speed_hz;<br>
&gt; &gt; + &nbsp; u32 cmd;<br>
&gt; &gt; + &nbsp; u32 addr;<br>
&gt; &gt; + &nbsp; u32 dummy;<br>
&gt; &gt; + &nbsp; u32 smcr;<br>
&gt; &gt; + &nbsp; u32 smenr;<br>
&gt; &gt; + &nbsp; u32 xferlen;<br>
&gt; &gt; + &nbsp; u32 totalxferlen;<br>
&gt; <br>
&gt; This register cache might be a good candidate for regmap ?</font></tt>
<br>
<br><tt><font size=2>I don't know what does it mean ?</font></tt>
<br><tt><font size=2>Could you give me more information!</font></tt>
<br><tt><font size=2><br>
&gt; <br>
&gt; &gt; + &nbsp; enum spi_mem_data_dir xfer_dir;<br>
&gt; &gt; +};<br>
&gt; &gt; +<br>
&gt; &gt; +static int rpc_spi_set_freq(struct rpc_spi *rpc, unsigned long
freq)<br>
&gt; &gt; +{<br>
&gt; &gt; + &nbsp; int ret;<br>
&gt; &gt; +<br>
&gt; &gt; + &nbsp; if (rpc-&gt;cur_speed_hz == freq)<br>
&gt; &gt; + &nbsp; &nbsp; &nbsp;return 0;<br>
&gt; &gt; +<br>
&gt; &gt; + &nbsp; clk_disable_unprepare(rpc-&gt;clk_rpc);<br>
&gt; &gt; + &nbsp; ret = clk_set_rate(rpc-&gt;clk_rpc, freq);<br>
&gt; &gt; + &nbsp; if (ret)<br>
&gt; &gt; + &nbsp; &nbsp; &nbsp;return ret;<br>
&gt; &gt; +<br>
&gt; &gt; + &nbsp; ret = clk_prepare_enable(rpc-&gt;clk_rpc);<br>
&gt; &gt; + &nbsp; if (ret)<br>
&gt; &gt; + &nbsp; &nbsp; &nbsp;return ret;<br>
&gt; <br>
&gt; Is this clock disable/update/enable really needed ? I'd think that<br>
&gt; clk_set_rate() would handle the rate update correctly.</font></tt>
<br>
<br><tt><font size=2>As Gerrt mentioned, I will remove them.</font></tt>
<br><tt><font size=2><br>
<br>
&gt; &gt; +static int wait_msg_xfer_end(struct rpc_spi *rpc)<br>
&gt; &gt; +{<br>
&gt; &gt; + &nbsp; u32 sts;<br>
&gt; &gt; +<br>
&gt; &gt; + &nbsp; return readl_poll_timeout(rpc-&gt;regs + RPC_CMNSR,
sts,<br>
&gt; &gt; + &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;sts &amp; RPC_CMNSR_TEND,
0, USEC_PER_SEC);<br>
&gt; &gt; +}<br>
&gt; &gt; +<br>
&gt; &gt; +static u8 rpc_bits_xfer(u32 nbytes)<br>
&gt; &gt; +{<br>
&gt; &gt; + &nbsp; u8 databyte;<br>
&gt; &gt; +<br>
&gt; &gt; + &nbsp; switch (nbytes) {<br>
&gt; <br>
&gt; Did you ever test unaligned writes and reads ? There are some nasty
edge<br>
&gt; cases in those.<br>
&gt; <br>
&gt; Also, I think you can calculate the number of set bits using a simple<br>
&gt; function, so the switch-case might not even be needed.<br>
&gt; </font></tt>
<br>
<br><tt><font size=2>Any example function ?</font></tt>
<br><tt><font size=2><br>
&gt; &gt; + &nbsp; case 1:<br>
&gt; &gt; + &nbsp; &nbsp; &nbsp;databyte = 0x8;<br>
&gt; &gt; + &nbsp; &nbsp; &nbsp;break;<br>
&gt; &gt; + &nbsp; case 2:<br>
&gt; &gt; + &nbsp; &nbsp; &nbsp;databyte = 0xc;<br>
&gt; &gt; + &nbsp; &nbsp; &nbsp;break;<br>
&gt; &gt; + &nbsp; default:<br>
&gt; &gt; + &nbsp; &nbsp; &nbsp;databyte = 0xf;<br>
&gt; &gt; + &nbsp; &nbsp; &nbsp;break;<br>
&gt; &gt; + &nbsp; }<br>
&gt; &gt; +<br>
&gt; &gt; + &nbsp; return databyte;<br>
&gt; &gt; +}<br>
&gt; &gt; +<br>
&gt; &gt; +static int rpc_spi_io_xfer(struct rpc_spi *rpc,<br>
&gt; &gt; + &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;const void *tx_buf,
void *rx_buf)<br>
&gt; &gt; +{<br>
&gt; &gt; + &nbsp; u32 smenr, smcr, data, pos = 0;<br>
&gt; &gt; + &nbsp; int ret = 0;<br>
&gt; &gt; +<br>
&gt; &gt; + &nbsp; writel(RPC_CMNCR_MD | RPC_CMNCR_SFDE | RPC_CMNCR_MOIIO_HIZ
|<br>
&gt; &gt; + &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;RPC_CMNCR_IOFV_HIZ | RPC_CMNCR_BSZ(0),
rpc-&gt;regs + RPC_CMNCR);<br>
&gt; &gt; + &nbsp; writel(0x0, rpc-&gt;regs + RPC_SMDRENR);<br>
&gt; &gt; +<br>
&gt; &gt; + &nbsp; if (tx_buf) {<br>
&gt; &gt; + &nbsp; &nbsp; &nbsp;writel(rpc-&gt;cmd, rpc-&gt;regs + RPC_SMCMR);<br>
&gt; &gt; + &nbsp; &nbsp; &nbsp;writel(rpc-&gt;dummy, rpc-&gt;regs + RPC_SMDMCR);<br>
&gt; &gt; + &nbsp; &nbsp; &nbsp;writel(rpc-&gt;addr, rpc-&gt;regs + RPC_SMADR);<br>
&gt; &gt; + &nbsp; &nbsp; &nbsp;smenr = rpc-&gt;smenr;<br>
&gt; &gt; +<br>
&gt; &gt; + &nbsp; &nbsp; &nbsp;while (pos &lt; rpc-&gt;xferlen) {<br>
&gt; &gt; + &nbsp; &nbsp; &nbsp; &nbsp; u32 nbytes = rpc-&gt;xferlen &nbsp;-
pos;<br>
&gt; &gt; +<br>
&gt; &gt; + &nbsp; &nbsp; &nbsp; &nbsp; writel(*(u32 *)(tx_buf + pos),
rpc-&gt;regs + RPC_SMWDR0);<br>
&gt; &gt; +<br>
&gt; &gt; + &nbsp; &nbsp; &nbsp; &nbsp; if (nbytes &gt; 4) {<br>
&gt; &gt; + &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;nbytes = 4;<br>
&gt; &gt; + &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;smcr = rpc-&gt;smcr
|<br>
&gt; &gt; + &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
RPC_SMCR_SPIE | RPC_SMCR_SSLKP;<br>
&gt; &gt; + &nbsp; &nbsp; &nbsp; &nbsp; } else {<br>
&gt; &gt; + &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;smcr = rpc-&gt;smcr
| RPC_SMCR_SPIE;<br>
&gt; &gt; + &nbsp; &nbsp; &nbsp; &nbsp; }<br>
&gt; &gt; +<br>
&gt; &gt; + &nbsp; &nbsp; &nbsp; &nbsp; writel(smenr, rpc-&gt;regs + RPC_SMENR);<br>
&gt; &gt; + &nbsp; &nbsp; &nbsp; &nbsp; writel(smcr, rpc-&gt;regs + RPC_SMCR);<br>
&gt; &gt; + &nbsp; &nbsp; &nbsp; &nbsp; ret = wait_msg_xfer_end(rpc);<br>
&gt; &gt; + &nbsp; &nbsp; &nbsp; &nbsp; if (ret)<br>
&gt; &gt; + &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;goto out;<br>
&gt; &gt; +<br>
&gt; &gt; + &nbsp; &nbsp; &nbsp; &nbsp; pos += nbytes;<br>
&gt; &gt; + &nbsp; &nbsp; &nbsp; &nbsp; smenr = rpc-&gt;smenr &amp; ~RPC_SMENR_CDE
&amp;<br>
&gt; &gt; + &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
&nbsp;~RPC_SMENR_ADE(0xf);<br>
&gt; &gt; + &nbsp; &nbsp; &nbsp;}<br>
&gt; &gt; + &nbsp; } else if (rx_buf) {<br>
&gt; &gt; + &nbsp; &nbsp; &nbsp;while (pos &lt; rpc-&gt;xferlen) {<br>
&gt; &gt; + &nbsp; &nbsp; &nbsp; &nbsp; u32 nbytes = rpc-&gt;xferlen &nbsp;-
pos;<br>
&gt; &gt; +<br>
&gt; &gt; + &nbsp; &nbsp; &nbsp; &nbsp; if (nbytes &gt; 4)<br>
&gt; &gt; + &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;nbytes = 4;<br>
&gt; &gt; +<br>
&gt; &gt; + &nbsp; &nbsp; &nbsp; &nbsp; writel(rpc-&gt;cmd, rpc-&gt;regs
+ RPC_SMCMR);<br>
&gt; &gt; + &nbsp; &nbsp; &nbsp; &nbsp; writel(rpc-&gt;dummy, rpc-&gt;regs
+ RPC_SMDMCR);<br>
&gt; &gt; + &nbsp; &nbsp; &nbsp; &nbsp; writel(rpc-&gt;addr + pos, rpc-&gt;regs
+ RPC_SMADR);<br>
&gt; &gt; + &nbsp; &nbsp; &nbsp; &nbsp; writel(rpc-&gt;smenr, rpc-&gt;regs
+ RPC_SMENR);<br>
&gt; &gt; + &nbsp; &nbsp; &nbsp; &nbsp; writel(rpc-&gt;smcr | RPC_SMCR_SPIE,
rpc-&gt;regs + RPC_SMCR);<br>
&gt; &gt; + &nbsp; &nbsp; &nbsp; &nbsp; ret = wait_msg_xfer_end(rpc);<br>
&gt; &gt; + &nbsp; &nbsp; &nbsp; &nbsp; if (ret)<br>
&gt; &gt; + &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;goto out;<br>
&gt; &gt; +<br>
&gt; &gt; + &nbsp; &nbsp; &nbsp; &nbsp; data = readl(rpc-&gt;regs + RPC_SMRDR0);<br>
&gt; &gt; + &nbsp; &nbsp; &nbsp; &nbsp; memcpy_fromio(rx_buf + pos, (void
*)&amp;data, nbytes);<br>
&gt; &gt; + &nbsp; &nbsp; &nbsp; &nbsp; pos += nbytes;<br>
&gt; &gt; + &nbsp; &nbsp; &nbsp;}<br>
&gt; &gt; + &nbsp; } else {<br>
&gt; &gt; + &nbsp; &nbsp; &nbsp;writel(rpc-&gt;cmd, rpc-&gt;regs + RPC_SMCMR);<br>
&gt; &gt; + &nbsp; &nbsp; &nbsp;writel(rpc-&gt;dummy, rpc-&gt;regs + RPC_SMDMCR);<br>
&gt; &gt; + &nbsp; &nbsp; &nbsp;writel(rpc-&gt;addr + pos, rpc-&gt;regs
+ RPC_SMADR);<br>
&gt; &gt; + &nbsp; &nbsp; &nbsp;writel(rpc-&gt;smenr, rpc-&gt;regs + RPC_SMENR);<br>
&gt; &gt; + &nbsp; &nbsp; &nbsp;writel(rpc-&gt;smcr | RPC_SMCR_SPIE, rpc-&gt;regs
+ RPC_SMCR);<br>
&gt; &gt; + &nbsp; &nbsp; &nbsp;ret = wait_msg_xfer_end(rpc);<br>
&gt; &gt; + &nbsp; }<br>
&gt; &gt; +out:<br>
&gt; <br>
&gt; Dont you need to stop the RPC somehow in case the transmission fails
?<br>
&gt; </font></tt>
<br>
<br><tt><font size=2>I can't find any RPC registers can do this !</font></tt>
<br>
<br><tt><font size=2>Do you know how to do this ?</font></tt>
<br>
<br><tt><font size=2><br>
<br>
&gt; &gt; + &nbsp; writel(rpc-&gt;cmd, rpc-&gt;regs + RPC_SMCMR);<br>
&gt; &gt; + &nbsp; writel(offs, rpc-&gt;regs + RPC_SMADR);<br>
&gt; &gt; + &nbsp; writel(rpc-&gt;smenr, rpc-&gt;regs + RPC_SMENR);<br>
&gt; &gt; + &nbsp; writel(rpc-&gt;smcr | RPC_SMCR_SPIE, rpc-&gt;regs +
RPC_SMCR);<br>
&gt; &gt; + &nbsp; ret = wait_msg_xfer_end(rpc);<br>
&gt; &gt; + &nbsp; if (ret)<br>
&gt; &gt; + &nbsp; &nbsp; &nbsp;goto out;<br>
&gt; &gt; +<br>
&gt; &gt; + &nbsp; writel(RPC_DRCR_RCF, rpc-&gt;regs + RPC_DRCR);<br>
&gt; &gt; + &nbsp; writel(RPC_PHYCNT_CAL | RPC_PHYCNT_STRTIM(0) | 0x260,<br>
&gt; &gt; + &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;rpc-&gt;regs + RPC_PHYCNT);<br>
&gt; &gt; +<br>
&gt; &gt; + &nbsp; return len;<br>
&gt; &gt; +out:<br>
&gt; <br>
&gt; Shouldn't you shut the controller down if the xfer fails ?</font></tt>
<br>
<br><tt><font size=2>Any registers can shut down RPC controller ? </font></tt>
<br><tt><font size=2>SW reset ? </font></tt>
<br>
<br><tt><font size=2><br>
&gt; <br>
&gt; &gt; + &nbsp; return ret;<br>
&gt; &gt; +}<br>
&gt; &gt; +<br>
&gt; &gt; +static int rpc_spi_mem_dirmap_create(struct spi_mem_dirmap_desc
*desc)<br>
&gt; &gt; +{<br>
&gt; &gt; + &nbsp; struct rpc_spi *rpc = spi_master_get_devdata(desc-&gt;mem-&gt;spi-&gt;master);<br>
&gt; &gt; +<br>
&gt; &gt; + &nbsp; if (desc-&gt;info.offset + desc-&gt;info.length &gt;
U32_MAX)<br>
&gt; &gt; + &nbsp; &nbsp; &nbsp;return -ENOTSUPP;<br>
&gt; &gt; +<br>
&gt; &gt; + &nbsp; if (!rpc_spi_mem_supports_op(desc-&gt;mem, &amp;desc-&gt;info.op_tmpl))<br>
&gt; &gt; + &nbsp; &nbsp; &nbsp;return -ENOTSUPP;<br>
&gt; &gt; +<br>
&gt; &gt; + &nbsp; if (!rpc-&gt;linear.map &amp;&amp;<br>
&gt; &gt; + &nbsp; &nbsp; &nbsp; desc-&gt;info.op_tmpl.data.dir == SPI_MEM_DATA_IN)<br>
&gt; &gt; + &nbsp; &nbsp; &nbsp;return -ENOTSUPP;<br>
&gt; &gt; +<br>
&gt; &gt; + &nbsp; return 0;<br>
&gt; &gt; +}<br>
&gt; &gt; +<br>
&gt; &gt; +static int rpc_spi_mem_exec_op(struct spi_mem *mem,<br>
&gt; &gt; + &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;const
struct spi_mem_op *op)<br>
&gt; &gt; +{<br>
&gt; &gt; + &nbsp; struct rpc_spi *rpc = spi_master_get_devdata(mem-&gt;spi-&gt;master);<br>
&gt; &gt; + &nbsp; int ret;<br>
&gt; &gt; +<br>
&gt; &gt; + &nbsp; ret = rpc_spi_set_freq(rpc, mem-&gt;spi-&gt;max_speed_hz);<br>
&gt; &gt; + &nbsp; if (ret)<br>
&gt; &gt; + &nbsp; &nbsp; &nbsp;return ret;<br>
&gt; &gt; +<br>
&gt; &gt; + &nbsp; rpc_spi_mem_set_prep_op_cfg(mem-&gt;spi, op, NULL, NULL);<br>
&gt; &gt; +<br>
&gt; &gt; + &nbsp; ret = rpc_spi_io_xfer(rpc,<br>
&gt; &gt; + &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; op-&gt;data.dir
== SPI_MEM_DATA_OUT ?<br>
&gt; &gt; + &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; op-&gt;data.buf.out
: NULL,<br>
&gt; &gt; + &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; op-&gt;data.dir
== SPI_MEM_DATA_IN ?<br>
&gt; &gt; + &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; op-&gt;data.buf.in
: NULL);<br>
&gt; &gt; +<br>
&gt; &gt; + &nbsp; return ret;<br>
&gt; &gt; +}<br>
&gt; &gt; +<br>
&gt; &gt; +static const struct spi_controller_mem_ops rpc_spi_mem_ops =
{<br>
&gt; &gt; + &nbsp; .supports_op = rpc_spi_mem_supports_op,<br>
&gt; &gt; + &nbsp; .exec_op = rpc_spi_mem_exec_op,<br>
&gt; &gt; + &nbsp; .dirmap_create = rpc_spi_mem_dirmap_create,<br>
&gt; &gt; + &nbsp; .dirmap_read = rpc_spi_mem_dirmap_read,<br>
&gt; &gt; + &nbsp; .dirmap_write = rpc_spi_mem_dirmap_write,<br>
&gt; &gt; +};<br>
&gt; &gt; +<br>
&gt; &gt; +static void rpc_spi_transfer_setup(struct rpc_spi *rpc,<br>
&gt; &gt; + &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; struct spi_message
*msg)<br>
&gt; &gt; +{<br>
&gt; &gt; + &nbsp; struct spi_transfer *t, xfer[4] = { };<br>
&gt; &gt; + &nbsp; u32 i, xfercnt, xferpos = 0;<br>
&gt; &gt; +<br>
&gt; &gt; + &nbsp; rpc-&gt;totalxferlen = 0;<br>
&gt; &gt; + &nbsp; list_for_each_entry(t, &amp;msg-&gt;transfers, transfer_list)
{<br>
&gt; &gt; + &nbsp; &nbsp; &nbsp;if (t-&gt;tx_buf) {<br>
&gt; &gt; + &nbsp; &nbsp; &nbsp; &nbsp; xfer[xferpos].tx_buf = t-&gt;tx_buf;<br>
&gt; &gt; + &nbsp; &nbsp; &nbsp; &nbsp; xfer[xferpos].tx_nbits = t-&gt;tx_nbits;<br>
&gt; &gt; + &nbsp; &nbsp; &nbsp;}<br>
&gt; &gt; +<br>
&gt; &gt; + &nbsp; &nbsp; &nbsp;if (t-&gt;rx_buf) {<br>
&gt; &gt; + &nbsp; &nbsp; &nbsp; &nbsp; xfer[xferpos].rx_buf = t-&gt;rx_buf;<br>
&gt; &gt; + &nbsp; &nbsp; &nbsp; &nbsp; xfer[xferpos].rx_nbits = t-&gt;rx_nbits;<br>
&gt; &gt; + &nbsp; &nbsp; &nbsp;}<br>
&gt; &gt; +<br>
&gt; &gt; + &nbsp; &nbsp; &nbsp;if (t-&gt;len) {<br>
&gt; &gt; + &nbsp; &nbsp; &nbsp; &nbsp; xfer[xferpos++].len = t-&gt;len;<br>
&gt; &gt; + &nbsp; &nbsp; &nbsp; &nbsp; rpc-&gt;totalxferlen += t-&gt;len;<br>
&gt; &gt; + &nbsp; &nbsp; &nbsp;}<br>
&gt; &gt; + &nbsp; }<br>
&gt; &gt; +<br>
&gt; &gt; + &nbsp; xfercnt = xferpos;<br>
&gt; &gt; + &nbsp; rpc-&gt;xferlen = xfer[--xferpos].len;<br>
&gt; &gt; + &nbsp; rpc-&gt;cmd = RPC_SMCMR_CMD(((u8 *)xfer[0].tx_buf)[0]);<br>
&gt; <br>
&gt; Is the cast needed ?</font></tt>
<br>
<br><tt><font size=2>? </font></tt>
<br><tt><font size=2><br>
&gt; <br>
&gt; &gt; + &nbsp; rpc-&gt;smenr = RPC_SMENR_CDE | RPC_SMENR_CDB(fls(xfer[0].tx_nbits
&gt;&gt; 1));<br>
&gt; &gt; + &nbsp; rpc-&gt;addr = 0;<br>
&gt; &gt; +<br>
&gt; &gt; + &nbsp; if (xfercnt &gt; 2 &amp;&amp; xfer[1].len &amp;&amp;
xfer[1].tx_buf) {<br>
&gt; &gt; + &nbsp; &nbsp; &nbsp;rpc-&gt;smenr |= RPC_SMENR_ADB(fls(xfer[1].tx_nbits
&gt;&gt; 1));<br>
&gt; &gt; + &nbsp; &nbsp; &nbsp;for (i = 0; i &lt; xfer[1].len; i++)<br>
&gt; &gt; + &nbsp; &nbsp; &nbsp; &nbsp; rpc-&gt;addr |= (u32)((u8 *)xfer[1].tx_buf)[i]<br>
&gt; &gt; + &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &lt;&lt; (8
* (xfer[1].len - i - 1));<br>
&gt; &gt; +<br>
&gt; &gt; + &nbsp; &nbsp; &nbsp;if (xfer[1].len == 4)<br>
&gt; &gt; + &nbsp; &nbsp; &nbsp; &nbsp; rpc-&gt;smenr |= RPC_SMENR_ADE(0xf);<br>
&gt; &gt; + &nbsp; &nbsp; &nbsp;else<br>
&gt; &gt; + &nbsp; &nbsp; &nbsp; &nbsp; rpc-&gt;smenr |= RPC_SMENR_ADE(0x7);<br>
&gt; &gt; + &nbsp; }<br>
&gt; &gt; +<br>
&gt; &gt; + &nbsp; switch (xfercnt) {<br>
&gt; &gt; + &nbsp; case 2:<br>
&gt; &gt; + &nbsp; &nbsp; &nbsp;if (xfer[1].rx_buf) {<br>
&gt; &gt; + &nbsp; &nbsp; &nbsp; &nbsp; rpc-&gt;smenr |= RPC_SMENR_SPIDE(rpc_bits_xfer<br>
&gt; &gt; + &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;(xfer[1].len))
| RPC_SMENR_SPIDB(fls<br>
&gt; &gt; + &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;(xfer[1].rx_nbits
&gt;&gt; 1));<br>
&gt; <br>
&gt; How much of this register value calculation could be somehow<br>
&gt; deduplicated ? It seems to be almost the same thing copied thrice
here.</font></tt>
<br>
<br><tt><font size=2>I don't get your point!</font></tt>
<br>
<br><tt><font size=2>The 2'nd transfer may be </font></tt>
<br><tt><font size=2>1) spi-address </font></tt>
<br><tt><font size=2>2) tx_buf[] for write registers.</font></tt>
<br><tt><font size=2>3) rx_buf[] for read status.</font></tt>
<br>
<br><tt><font size=2>parse them and write to rpc-&gt;addr and so on.</font></tt>
<br><tt><font size=2>Or you have a better way to do this ?</font></tt>
<br>
<br>
<br><tt><font size=2>thanks again for your review &amp; help.</font></tt>
<br><tt><font size=2><br>
best regards,</font></tt>
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

--=_alternative 00042D704825834E_=--
