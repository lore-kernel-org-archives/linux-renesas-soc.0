Return-Path: <SRS0=XP2S=QL=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=3.0 tests=DKIMWL_WL_MED,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_PASS autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 20E0DC282D7
	for <linux-renesas-soc@archiver.kernel.org>; Mon,  4 Feb 2019 18:07:01 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id D31FB2082E
	for <linux-renesas-soc@archiver.kernel.org>; Mon,  4 Feb 2019 18:07:00 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=cogentembedded-com.20150623.gappssmtp.com header.i=@cogentembedded-com.20150623.gappssmtp.com header.b="PHVpigF8"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728169AbfBDSG6 (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Mon, 4 Feb 2019 13:06:58 -0500
Received: from mail-lf1-f68.google.com ([209.85.167.68]:35895 "EHLO
        mail-lf1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726585AbfBDSG5 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 4 Feb 2019 13:06:57 -0500
Received: by mail-lf1-f68.google.com with SMTP id a16so628112lfg.3
        for <linux-renesas-soc@vger.kernel.org>; Mon, 04 Feb 2019 10:06:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cogentembedded-com.20150623.gappssmtp.com; s=20150623;
        h=subject:from:to:cc:references:organization:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=yVFZMLfM5Mf/hx+mOeFeITtE3HycYn9JLFRNcumD3iY=;
        b=PHVpigF8yYpYGIy8GVgNogi87XQsQOv3gRSLq1NeUC82mGikJ6+5WRYlu3z0LBfPmV
         WC3Wkk50PfMTCSGG0/xzshb5kCGj+mAkhRD84jQxAZwKXgpof6OTS5TGWBUVxIeIArwB
         okAfynl3lo+dYQq5xBekfx7fuZwei4KJ8oCikmKshUUIUV5znBzv8FyxfxCuUSrpRMnr
         Lqu+w4XMQWBnVVfGVqtC++kpee1xeKEDW/48pP8X6HEw5BvrZicW/1wU1E+/7GP3qqgQ
         oFSSlxB0Fzss1vtlwKiO4hci6xiw7gFcarrdwS6UNOzxqmLKlLT+Fax7By3A0za7Mfdj
         nAdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:from:to:cc:references:organization
         :message-id:date:user-agent:mime-version:in-reply-to
         :content-language:content-transfer-encoding;
        bh=yVFZMLfM5Mf/hx+mOeFeITtE3HycYn9JLFRNcumD3iY=;
        b=k2GV5KzBMkXQCNB6/1SEYkREUCQKxOt0Grbxl8a6ebQUYOBLOJowdiPJ0Fh2NXV01T
         yCgvmfjsNjwdPmg6KXv8zKj341RI54m9gDPVQIe2UK3cTZJKAcTDZOX5fz2X3wd4/Fh8
         qmpWp9V6BlNUJT+POSzyWIbA5abSYsBtxICtv606HBCnxhCpkZ0BSKqidim3uZnrFvmJ
         ufg/bfYxDiM3wrOcFb/T/t4r7ZghpuKe1D2wXfMY+P+5caaw/A/qsASND5cYiWOGZ8Dc
         uvVSKuarlkHg3gfqn1BfARpzgsmIfQPCmR05auCkcODxOWEUJAW1g5cqVDQA1TT7zz8Y
         F3ig==
X-Gm-Message-State: AHQUAubxvmz+sTAaToIfhIqmNOfBUkUV4264e1ky6ksAF9FiRJAIydLk
        xwsOJOvxoMhspwn11J9iGSOFpw==
X-Google-Smtp-Source: AHgI3Iay8gO+XhbilmgEm4ivBnhrCDf1sJojgtPg74hmWGbF7sQv8FQ0PxPHWmPHBfkGXCM9JUw5VQ==
X-Received: by 2002:a19:9e11:: with SMTP id h17mr381975lfe.73.1549303614134;
        Mon, 04 Feb 2019 10:06:54 -0800 (PST)
Received: from wasted.cogentembedded.com ([31.173.83.140])
        by smtp.gmail.com with ESMTPSA id z15-v6sm3146809ljb.9.2019.02.04.10.06.53
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 04 Feb 2019 10:06:53 -0800 (PST)
Subject: [PATCH v2 2/7] sh_eth: RX checksum offload support
From:   Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
To:     netdev@vger.kernel.org, "David S. Miller" <davem@davemloft.net>
Cc:     linux-renesas-soc@vger.kernel.org, linux-sh@vger.kernel.org
References: <a21deed1-35dc-f1be-6c7e-7061ebe4b56c@cogentembedded.com>
Organization: Cogent Embedded
Message-ID: <6bd27192-d158-d3bf-4db7-6a442c29f16c@cogentembedded.com>
Date:   Mon, 4 Feb 2019 21:06:52 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
 Thunderbird/52.2.1
MIME-Version: 1.0
In-Reply-To: <a21deed1-35dc-f1be-6c7e-7061ebe4b56c@cogentembedded.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-MW
Content-Transfer-Encoding: 7bit
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Add support for the RX checksum offload. This is enabled by default and
may be disabled and re-enabled using 'ethtool':

# ethtool -K eth0 rx off
# ethtool -K eth0 rx on

Some Ether MACs provide a simple checksumming scheme which appears to be
completely compatible with CHECKSUM_COMPLETE: sum of all packet data after
the L2 header is appended to packet data; this may be trivially read by
the driver and used to update the skb accordingly. The same checksumming
scheme is implemented in the EtherAVB MACs and now supported by tha 'ravb'
driver.

In terms of performance, throughput is close to gigabit line rate with the
RX checksum offload both enabled and disabled.  The 'perf' output, however,
appears to indicate that significantly less time is spent in do_csum() --
this is as expected.

Test results with RX checksum offload enabled:

~/netperf-2.2pl4# perf record -a ./netperf -t TCP_MAERTS -H 192.168.2.4
TCP MAERTS TEST to 192.168.2.4
Recv   Send    Send
Socket Socket  Message  Elapsed
Size   Size    Size     Time     Throughput
bytes  bytes   bytes    secs.    10^6bits/sec

131072  16384  16384    10.01     933.93
[ perf record: Woken up 8 times to write data ]
[ perf record: Captured and wrote 1.955 MB perf.data (41940 samples) ]
~/netperf-2.2pl4# perf report
Samples: 41K of event 'cycles:ppp', Event count (approx.): 9915302763
Overhead  Command          Shared Object             Symbol
   9.44%  netperf          [kernel.kallsyms]         [k] __arch_copy_to_user
   7.75%  swapper          [kernel.kallsyms]         [k] _raw_spin_unlock_irq
   6.31%  swapper          [kernel.kallsyms]         [k] default_idle_call
   5.89%  swapper          [kernel.kallsyms]         [k] arch_cpu_idle
   4.37%  swapper          [kernel.kallsyms]         [k] tick_nohz_idle_exit
   4.02%  netperf          [kernel.kallsyms]         [k] _raw_spin_unlock_irq
   2.52%  netperf          [kernel.kallsyms]         [k] preempt_count_sub
   1.81%  netperf          [kernel.kallsyms]         [k] tcp_recvmsg
   1.80%  netperf          [kernel.kallsyms]         [k] _raw_spin_unlock_irqres
   1.78%  netperf          [kernel.kallsyms]         [k] preempt_count_add
   1.36%  netperf          [kernel.kallsyms]         [k] __tcp_transmit_skb
   1.20%  netperf          [kernel.kallsyms]         [k] __local_bh_enable_ip
   1.10%  netperf          [kernel.kallsyms]         [k] sh_eth_start_xmit

Test results with RX checksum offload disabled:

~/netperf-2.2pl4# perf record -a ./netperf -t TCP_MAERTS -H 192.168.2.4
TCP MAERTS TEST to 192.168.2.4
Recv   Send    Send
Socket Socket  Message  Elapsed
Size   Size    Size     Time     Throughput
bytes  bytes   bytes    secs.    10^6bits/sec
131072  16384  16384    10.01     932.04
[ perf record: Woken up 14 times to write data ]
[ perf record: Captured and wrote 3.642 MB perf.data (78817 samples) ]
~/netperf-2.2pl4# perf report
Samples: 78K of event 'cycles:ppp', Event count (approx.): 18091442796          
Overhead  Command          Shared Object       Symbol                           
   7.00%  swapper          [kernel.kallsyms]   [k] do_csum                      
   3.94%  swapper          [kernel.kallsyms]   [k] sh_eth_poll                  
   3.83%  ksoftirqd/0      [kernel.kallsyms]   [k] do_csum                      
   3.23%  swapper          [kernel.kallsyms]   [k] _raw_spin_unlock_irq         
   2.87%  netperf          [kernel.kallsyms]   [k] __arch_copy_to_user          
   2.86%  swapper          [kernel.kallsyms]   [k] arch_cpu_idle                
   2.13%  swapper          [kernel.kallsyms]   [k] default_idle_call            
   2.12%  ksoftirqd/0      [kernel.kallsyms]   [k] sh_eth_poll                  
   2.02%  swapper          [kernel.kallsyms]   [k] _raw_spin_unlock_irqrestore  
   1.84%  swapper          [kernel.kallsyms]   [k] __softirqentry_text_start    
   1.64%  swapper          [kernel.kallsyms]   [k] tick_nohz_idle_exit          
   1.53%  netperf          [kernel.kallsyms]   [k] _raw_spin_unlock_irq         
   1.32%  netperf          [kernel.kallsyms]   [k] preempt_count_sub            
   1.27%  swapper          [kernel.kallsyms]   [k] __pi___inval_dcache_area     
   1.22%  swapper          [kernel.kallsyms]   [k] check_preemption_disabled    
   1.01%  ksoftirqd/0      [kernel.kallsyms]   [k] _raw_spin_unlock_irqrestore  

The above results collected on the R-Car V3H Starter Kit board.

Based on the commit 4d86d3818627 ("ravb: RX checksum offload")...

Signed-off-by: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>

---
Changes in version 2:
- clarified the command line example.

 drivers/net/ethernet/renesas/sh_eth.c |   60 ++++++++++++++++++++++++++++++++--
 drivers/net/ethernet/renesas/sh_eth.h |    1 
 2 files changed, 59 insertions(+), 2 deletions(-)

Index: renesas/drivers/net/ethernet/renesas/sh_eth.c
===================================================================
--- renesas.orig/drivers/net/ethernet/renesas/sh_eth.c
+++ renesas/drivers/net/ethernet/renesas/sh_eth.c
@@ -1532,8 +1532,9 @@ static int sh_eth_dev_init(struct net_de
 	mdp->irq_enabled = true;
 	sh_eth_write(ndev, mdp->cd->eesipr_value, EESIPR);
 
-	/* PAUSE Prohibition */
+	/* EMAC Mode: PAUSE prohibition; Duplex; RX Checksum; TX; RX */
 	sh_eth_write(ndev, ECMR_ZPF | (mdp->duplex ? ECMR_DM : 0) |
+		     (ndev->features & NETIF_F_RXCSUM ? ECMR_RCSC : 0) |
 		     ECMR_TE | ECMR_RE, ECMR);
 
 	if (mdp->cd->set_rate)
@@ -1592,6 +1593,19 @@ static void sh_eth_dev_exit(struct net_d
 	update_mac_address(ndev);
 }
 
+static void sh_eth_rx_csum(struct sk_buff *skb)
+{
+	u8 *hw_csum;
+
+	/* The hardware checksum is 2 bytes appended to packet data */
+	if (unlikely(skb->len < sizeof(__sum16)))
+		return;
+	hw_csum = skb_tail_pointer(skb) - sizeof(__sum16);
+	skb->csum = csum_unfold((__force __sum16)get_unaligned_le16(hw_csum));
+	skb->ip_summed = CHECKSUM_COMPLETE;
+	skb_trim(skb, skb->len - sizeof(__sum16));
+}
+
 /* Packet receive function */
 static int sh_eth_rx(struct net_device *ndev, u32 intr_status, int *quota)
 {
@@ -1666,6 +1680,8 @@ static int sh_eth_rx(struct net_device *
 					 DMA_FROM_DEVICE);
 			skb_put(skb, pkt_len);
 			skb->protocol = eth_type_trans(skb, ndev);
+			if (ndev->features & NETIF_F_RXCSUM)
+				sh_eth_rx_csum(skb);
 			netif_receive_skb(skb);
 			ndev->stats.rx_packets++;
 			ndev->stats.rx_bytes += pkt_len;
@@ -2921,6 +2937,39 @@ static void sh_eth_set_rx_mode(struct ne
 	spin_unlock_irqrestore(&mdp->lock, flags);
 }
 
+static void sh_eth_set_rx_csum(struct net_device *ndev, bool enable)
+{
+	struct sh_eth_private *mdp = netdev_priv(ndev);
+	unsigned long flags;
+
+	spin_lock_irqsave(&mdp->lock, flags);
+
+	/* Disable TX and RX */
+	sh_eth_rcv_snd_disable(ndev);
+
+	/* Modify RX Checksum setting */
+	sh_eth_modify(ndev, ECMR, ECMR_RCSC, enable ? ECMR_RCSC : 0);
+
+	/* Enable TX and RX */
+	sh_eth_rcv_snd_enable(ndev);
+
+	spin_unlock_irqrestore(&mdp->lock, flags);
+}
+
+static int sh_eth_set_features(struct net_device *ndev,
+			       netdev_features_t features)
+{
+	netdev_features_t changed = ndev->features ^ features;
+	struct sh_eth_private *mdp = netdev_priv(ndev);
+
+	if (changed & NETIF_F_RXCSUM && mdp->cd->rx_csum)
+		sh_eth_set_rx_csum(ndev, features & NETIF_F_RXCSUM);
+
+	ndev->features = features;
+
+	return 0;
+}
+
 static int sh_eth_get_vtag_index(struct sh_eth_private *mdp)
 {
 	if (!mdp->port)
@@ -3102,6 +3151,7 @@ static const struct net_device_ops sh_et
 	.ndo_change_mtu		= sh_eth_change_mtu,
 	.ndo_validate_addr	= eth_validate_addr,
 	.ndo_set_mac_address	= eth_mac_addr,
+	.ndo_set_features	= sh_eth_set_features,
 };
 
 static const struct net_device_ops sh_eth_netdev_ops_tsu = {
@@ -3117,6 +3167,7 @@ static const struct net_device_ops sh_et
 	.ndo_change_mtu		= sh_eth_change_mtu,
 	.ndo_validate_addr	= eth_validate_addr,
 	.ndo_set_mac_address	= eth_mac_addr,
+	.ndo_set_features	= sh_eth_set_features,
 };
 
 #ifdef CONFIG_OF
@@ -3245,6 +3296,11 @@ static int sh_eth_drv_probe(struct platf
 	ndev->max_mtu = 2000 - (ETH_HLEN + VLAN_HLEN + ETH_FCS_LEN);
 	ndev->min_mtu = ETH_MIN_MTU;
 
+	if (mdp->cd->rx_csum) {
+		ndev->features = NETIF_F_RXCSUM;
+		ndev->hw_features = NETIF_F_RXCSUM;
+	}
+
 	/* set function */
 	if (mdp->cd->tsu)
 		ndev->netdev_ops = &sh_eth_netdev_ops_tsu;
@@ -3294,7 +3350,7 @@ static int sh_eth_drv_probe(struct platf
 			goto out_release;
 		}
 		mdp->port = port;
-		ndev->features = NETIF_F_HW_VLAN_CTAG_FILTER;
+		ndev->features |= NETIF_F_HW_VLAN_CTAG_FILTER;
 
 		/* Need to init only the first port of the two sharing a TSU */
 		if (port == 0) {
Index: renesas/drivers/net/ethernet/renesas/sh_eth.h
===================================================================
--- renesas.orig/drivers/net/ethernet/renesas/sh_eth.h
+++ renesas/drivers/net/ethernet/renesas/sh_eth.h
@@ -500,6 +500,7 @@ struct sh_eth_cpu_data {
 	unsigned no_xdfar:1;	/* E-DMAC DOES NOT have RDFAR/TDFAR */
 	unsigned xdfar_rw:1;	/* E-DMAC has writeable RDFAR/TDFAR */
 	unsigned csmr:1;	/* E-DMAC has CSMR */
+	unsigned rx_csum:1;	/* EtherC has ECMR.RCSC */
 	unsigned select_mii:1;	/* EtherC has RMII_MII (MII select register) */
 	unsigned rmiimode:1;	/* EtherC has RMIIMODE register */
 	unsigned rtrate:1;	/* EtherC has RTRATE register */
