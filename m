Return-Path: <SRS0+M7eh=QD=vger.kernel.org=netdev-owner@vergenet.net>
Date: Fri, 08 Apr 2016 15:34:32 -0400 (EDT)
Message-Id: <20160408.153432.1402033245186117258.davem@davemloft.net>
To: jakub.kicinski@netronome.com
Cc: netdev@vger.kernel.org
Subject: Re: [PATCH v5 net-next 00/15] MTU/buffer reconfig changes
From: David Miller <davem@davemloft.net>
In-Reply-To: <1460054388-471-1-git-send-email-jakub.kicinski@netronome.com>
References: <1460054388-471-1-git-send-email-jakub.kicinski@netronome.com>
Mime-Version: 1.0
Content-Type: Text/Plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Sender: netdev-owner@vger.kernel.org
Return-Path: <SRS0+j/9D=QN=vger.kernel.org=netdev-owner@vergenet.net>
From: Daniel Borkmann <daniel@iogearbox.net>
To: davem@davemloft.net
Cc: alexei.starovoitov@gmail.com, tgraf@suug.ch,
	netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
	Daniel Borkmann <daniel@iogearbox.net>,
	Alexei Starovoitov <ast@kernel.org>
Subject: [PATCH net-next v2 1/2] bpf, trace: add BPF_F_CURRENT_CPU flag for bpf_perf_event_output
Date: Mon, 18 Apr 2016 21:01:23 +0200
Message-Id: <1ac610a73de124f26d417dcdb8e79fd81ac333b8.1461005139.git.daniel@iogearbox.net>
In-Reply-To: <cover.1461005139.git.daniel@iogearbox.net>
References: <cover.1461005139.git.daniel@iogearbox.net>
In-Reply-To: <cover.1461005139.git.daniel@iogearbox.net>
References: <cover.1461005139.git.daniel@iogearbox.net>
Sender: netdev-owner@vger.kernel.org
Return-Path: <SRS0+nX+X=QV=vger.kernel.org=linux-renesas-soc-owner@vergenet.net>
Received: from sauhun.de ([89.238.76.85]:51367 "EHLO pokefinder.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751815AbcDZQx5 (ORCPT
	<rfc822;linux-renesas-soc@vger.kernel.org>);
	Tue, 26 Apr 2016 12:53:57 -0400
From: Wolfram Sang <wsa@the-dreams.de>
To: linux-mmc@vger.kernel.org
Cc: Wolfram Sang <wsa@the-dreams.de>,
	linux-renesas-soc@vger.kernel.org,
	Ulf Hansson <ulf.hansson@linaro.org>,
	Simon Horman <horms+renesas@verge.net.au>
Subject: [PATCH v2 1/5] mmc: tmio: give read32/write32 functions more descriptive names
Date: Tue, 26 Apr 2016 18:53:41 +0200
Message-Id: <1461689625-3693-2-git-send-email-wsa@the-dreams.de>
In-Reply-To: <1461689625-3693-1-git-send-email-wsa@the-dreams.de>
References: <1461689625-3693-1-git-send-email-wsa@the-dreams.de>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>
Return-Path: <SRS0+M7eh=QD=vger.kernel.org=netdev-owner@vergenet.net>
Date: Fri, 08 Apr 2016 13:07:37 -0400 (EDT)
Message-Id: <20160408.130737.1379821883201014485.davem@davemloft.net>
To: jiri@resnulli.us
Cc: netdev@vger.kernel.org, idosch@mellanox.com, eladr@mellanox.com,
	yotamg@mellanox.com, ogerlitz@mellanox.com,
	roopa@cumulusnetworks.com, gospo@cumulusnetworks.com
Subject: Re: [patch net-next 0/5] mlxsw: small driver update
From: David Miller <davem@davemloft.net>
In-Reply-To: <20160408155155.GC1932@nanopsycho.orion>
References: <1460130325-14931-1-git-send-email-jiri@resnulli.us>
	<20160408155155.GC1932@nanopsycho.orion>
Mime-Version: 1.0
Content-Type: Text/Plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Sender: netdev-owner@vger.kernel.org
Return-Path: <SRS0+KHKh=QC=vger.kernel.org=netdev-owner@vergenet.net>
MIME-Version: 1.0
In-Reply-To: <20160407223237.11142.33072.stgit@ahduyck-xeon-server>
References: <20160407222211.11142.41024.stgit@ahduyck-xeon-server> <20160407223237.11142.33072.stgit@ahduyck-xeon-server>
From: Jesse Gross <jesse@kernel.org>
Date: Thu, 7 Apr 2016 20:22:57 -0300
Message-ID: <CAEh+42jyh0EWwaOAu3KNSQKEv3NRgjPT_4QRYUmLRSXtsMgWJw@mail.gmail.com>
Subject: Re: [RFC PATCH 07/11] GENEVE: Add option to mangle IP IDs on inner
 headers when using TSO
To: Alexander Duyck <aduyck@mirantis.com>
Cc: herbert@gondor.apana.org.au, Tom Herbert <tom@herbertland.com>,
	Alexander Duyck <alexander.duyck@gmail.com>,
	edumazet@google.com,
	Linux Kernel Network Developers <netdev@vger.kernel.org>,
	David Miller <davem@davemloft.net>
Content-Type: text/plain; charset=UTF-8
Sender: netdev-owner@vger.kernel.org
Return-Path: <SRS0+IXIp=QG=vger.kernel.org=linux-renesas-soc-owner@vergenet.net>
Received: from galahad.ideasonboard.com ([185.26.127.97]:54117 "EHLO
	galahad.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751624AbcDKQ0H (ORCPT
	<rfc822;linux-renesas-soc@vger.kernel.org>);
	Mon, 11 Apr 2016 12:26:07 -0400
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Marc Zyngier <marc.zyngier@arm.com>
Cc: Linus Walleij <linus.walleij@linaro.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Thomas Gleixner <tglx@linutronix.de>,
	Ulf Hansson <ulf.hansson@linaro.org>,
	Alexandre Courbot <gnurou@gmail.com>,
	Jon Hunter <jonathanh@nvidia.com>,
	Wolfram Sang <wsa@the-dreams.de>,
	Grygorii Strashko <grygorii.strashko@ti.com>,
	"linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>,
	"linux-pm@vger.kernel.org" <linux-pm@vger.kernel.org>,
	linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH/RFC v2] gpio: rcar: Add Runtime PM handling for interrupts
Date: Mon, 11 Apr 2016 19:26:09 +0300
Message-ID: <8178382.Z7YODHSRMC@avalon>
In-Reply-To: <56C703AC.4040803@arm.com>
References: <1455811590-15836-1-git-send-email-geert+renesas@glider.be> <CACRpkdZ2zzP5u4uJDzsnks7ywrp3ddBt+YfxthJ+5mT-ECYLpg@mail.gmail.com> <56C703AC.4040803@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: [v3,4/6] arm64: dts: salvator-x: enable PWM
From: Ulrich Hecht <ulrich.hecht+renesas@gmail.com>
Message-Id: <1459424356-26061-5-git-send-email-ulrich.hecht+renesas@gmail.com>
To: linux-renesas-soc@vger.kernel.org, geert@linux-m68k.org
Cc: linux-pwm@vger.kernel.org, thierry.reding@gmail.com,
	magnus.damm@gmail.com, Ulrich Hecht <ulrich.hecht+renesas@gmail.com>
Date: Thu, 31 Mar 2016 13:39:14 +0200

From: Jakub Kicinski <jakub.kicinski@netronome.com>
Date: Thu,  7 Apr 2016 19:39:33 +0100

> I re-discussed MPLS/MTU internally, dropped it from the patch 1,
> re-tested everything, found out I forgot about debugfs pointers,
> fixed that as well.
> 
> v5:
>  - don't reserve space in RX buffers for MPLS label stack
>    (patch 1);
>  - fix debugfs pointers to ring structures (patch 5).
> v4:
>  - cut down on unrelated patches;
>  - don't "close" the device on error path.
> 
> --- v4 cover letter
> 
> Previous series included some not entirely related patches,
> this one is cut down.  Main issue I'm trying to solve here
> is that .ndo_change_mtu() in nfpvf driver is doing full
> close/open to reallocate buffers - which if open fails
> can result in device being basically closed even though
> the interface is started.  As suggested by you I try to move
> towards a paradigm where the resources are allocated first
> and the MTU change is only done once I'm certain (almost)
> nothing can fail.  Almost because I need to communicate 
> with FW and that can always time out.
> 
> Patch 1 fixes small issue.  Next 10 patches reorganize things
> so that I can easily allocate new rings and sets of buffers
> while the device is running.  Patches 13 and 15 reshape the
> .ndo_change_mtu() and ethtool's ring-resize operation into
> desired form.

Looks good, series applied, thanks!

Add a BPF_F_CURRENT_CPU flag to optimize the use-case where user space has
per-CPU ring buffers and the eBPF program pushes the data into the current
CPU's ring buffer which saves us an extra helper function call in eBPF.
Also, make sure to properly reserve the remaining flags which are not used.

Signed-off-by: Daniel Borkmann <daniel@iogearbox.net>
Signed-off-by: Alexei Starovoitov <ast@kernel.org>
---
 include/uapi/linux/bpf.h | 4 ++++
 kernel/trace/bpf_trace.c | 7 ++++++-
 2 files changed, 10 insertions(+), 1 deletion(-)

diff --git a/include/uapi/linux/bpf.h b/include/uapi/linux/bpf.h
index 70eda5a..b7b0fb1 100644
--- a/include/uapi/linux/bpf.h
+++ b/include/uapi/linux/bpf.h
@@ -347,6 +347,10 @@ enum bpf_func_id {
 #define BPF_F_ZERO_CSUM_TX		(1ULL << 1)
 #define BPF_F_DONT_FRAGMENT		(1ULL << 2)
 
+/* BPF_FUNC_perf_event_output flags. */
+#define BPF_F_INDEX_MASK		0xffffffffULL
+#define BPF_F_CURRENT_CPU		BPF_F_INDEX_MASK
+
 /* user accessible mirror of in-kernel sk_buff.
  * new fields can only be added to the end of this structure
  */
diff --git a/kernel/trace/bpf_trace.c b/kernel/trace/bpf_trace.c
index 6855878..6bfe55c 100644
--- a/kernel/trace/bpf_trace.c
+++ b/kernel/trace/bpf_trace.c
@@ -225,11 +225,12 @@ static const struct bpf_func_proto bpf_perf_event_read_proto = {
 	.arg2_type	= ARG_ANYTHING,
 };
 
-static u64 bpf_perf_event_output(u64 r1, u64 r2, u64 index, u64 r4, u64 size)
+static u64 bpf_perf_event_output(u64 r1, u64 r2, u64 flags, u64 r4, u64 size)
 {
 	struct pt_regs *regs = (struct pt_regs *) (long) r1;
 	struct bpf_map *map = (struct bpf_map *) (long) r2;
 	struct bpf_array *array = container_of(map, struct bpf_array, map);
+	u64 index = flags & BPF_F_INDEX_MASK;
 	void *data = (void *) (long) r4;
 	struct perf_sample_data sample_data;
 	struct perf_event *event;
@@ -239,6 +240,10 @@ static u64 bpf_perf_event_output(u64 r1, u64 r2, u64 index, u64 r4, u64 size)
 		.data = data,
 	};
 
+	if (unlikely(flags & ~(BPF_F_INDEX_MASK)))
+		return -EINVAL;
+	if (index == BPF_F_CURRENT_CPU)
+		index = raw_smp_processor_id();
 	if (unlikely(index >= array->map.max_entries))
 		return -E2BIG;
 
-- 
1.9.3

From: Wolfram Sang <wsa+renesas@sang-engineering.com>

Looking at the backlogs, I am not the only one who missed that the above
functions do not read u32 from one register, but create a virtual u32
from reading to adjacent u16 registers (which depending on 'bus_shift'
can be up to 8 byte apart). Because this driver supports old hardware
for which we don't have documentation, I first wrongly assumed there was
a variant which had a few u32 registers. Let's give the functions more
descriptive names to make it more obvious what is happening.

Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
Reviewed-by: Simon Horman <horms+renesas@verge.net.au>
---
 drivers/mmc/host/tmio_mmc.h     |  5 ++---
 drivers/mmc/host/tmio_mmc_pio.c | 22 +++++++++++-----------
 2 files changed, 13 insertions(+), 14 deletions(-)

diff --git a/drivers/mmc/host/tmio_mmc.h b/drivers/mmc/host/tmio_mmc.h
index 439fdad2bad91d..e75e5ca220bc0a 100644
--- a/drivers/mmc/host/tmio_mmc.h
+++ b/drivers/mmc/host/tmio_mmc.h
@@ -232,7 +232,7 @@ static inline void sd_ctrl_read16_rep(struct tmio_mmc_host *host, int addr,
 	readsw(host->ctl + (addr << host->bus_shift), buf, count);
 }
 
-static inline u32 sd_ctrl_read32(struct tmio_mmc_host *host, int addr)
+static inline u32 sd_ctrl_read16_and_16_as_32(struct tmio_mmc_host *host, int addr)
 {
 	return readw(host->ctl + (addr << host->bus_shift)) |
 	       readw(host->ctl + ((addr + 2) << host->bus_shift)) << 16;
@@ -254,11 +254,10 @@ static inline void sd_ctrl_write16_rep(struct tmio_mmc_host *host, int addr,
 	writesw(host->ctl + (addr << host->bus_shift), buf, count);
 }
 
-static inline void sd_ctrl_write32(struct tmio_mmc_host *host, int addr, u32 val)
+static inline void sd_ctrl_write32_as_16_and_16(struct tmio_mmc_host *host, int addr, u32 val)
 {
 	writew(val, host->ctl + (addr << host->bus_shift));
 	writew(val >> 16, host->ctl + ((addr + 2) << host->bus_shift));
 }
 
-
 #endif
diff --git a/drivers/mmc/host/tmio_mmc_pio.c b/drivers/mmc/host/tmio_mmc_pio.c
index 15e6f6d5a42337..dad2ebd3dc22b4 100644
--- a/drivers/mmc/host/tmio_mmc_pio.c
+++ b/drivers/mmc/host/tmio_mmc_pio.c
@@ -55,18 +55,18 @@
 void tmio_mmc_enable_mmc_irqs(struct tmio_mmc_host *host, u32 i)
 {
 	host->sdcard_irq_mask &= ~(i & TMIO_MASK_IRQ);
-	sd_ctrl_write32(host, CTL_IRQ_MASK, host->sdcard_irq_mask);
+	sd_ctrl_write32_as_16_and_16(host, CTL_IRQ_MASK, host->sdcard_irq_mask);
 }
 
 void tmio_mmc_disable_mmc_irqs(struct tmio_mmc_host *host, u32 i)
 {
 	host->sdcard_irq_mask |= (i & TMIO_MASK_IRQ);
-	sd_ctrl_write32(host, CTL_IRQ_MASK, host->sdcard_irq_mask);
+	sd_ctrl_write32_as_16_and_16(host, CTL_IRQ_MASK, host->sdcard_irq_mask);
 }
 
 static void tmio_mmc_ack_mmc_irqs(struct tmio_mmc_host *host, u32 i)
 {
-	sd_ctrl_write32(host, CTL_STATUS, ~i);
+	sd_ctrl_write32_as_16_and_16(host, CTL_STATUS, ~i);
 }
 
 static void tmio_mmc_init_sg(struct tmio_mmc_host *host, struct mmc_data *data)
@@ -381,7 +381,7 @@ static int tmio_mmc_start_command(struct tmio_mmc_host *host, struct mmc_command
 	tmio_mmc_enable_mmc_irqs(host, irq_mask);
 
 	/* Fire off the command */
-	sd_ctrl_write32(host, CTL_ARG_REG, cmd->arg);
+	sd_ctrl_write32_as_16_and_16(host, CTL_ARG_REG, cmd->arg);
 	sd_ctrl_write16(host, CTL_SD_CMD, c);
 
 	return 0;
@@ -536,7 +536,7 @@ static void tmio_mmc_data_irq(struct tmio_mmc_host *host)
 		goto out;
 
 	if (host->chan_tx && (data->flags & MMC_DATA_WRITE) && !host->force_pio) {
-		u32 status = sd_ctrl_read32(host, CTL_STATUS);
+		u32 status = sd_ctrl_read16_and_16_as_32(host, CTL_STATUS);
 		bool done = false;
 
 		/*
@@ -591,7 +591,7 @@ static void tmio_mmc_cmd_irq(struct tmio_mmc_host *host,
 	 */
 
 	for (i = 3, addr = CTL_RESPONSE ; i >= 0 ; i--, addr += 4)
-		cmd->resp[i] = sd_ctrl_read32(host, addr);
+		cmd->resp[i] = sd_ctrl_read16_and_16_as_32(host, addr);
 
 	if (cmd->flags &  MMC_RSP_136) {
 		cmd->resp[0] = (cmd->resp[0] << 8) | (cmd->resp[1] >> 24);
@@ -708,14 +708,14 @@ irqreturn_t tmio_mmc_irq(int irq, void *devid)
 	struct tmio_mmc_host *host = devid;
 	unsigned int ireg, status;
 
-	status = sd_ctrl_read32(host, CTL_STATUS);
+	status = sd_ctrl_read16_and_16_as_32(host, CTL_STATUS);
 	ireg = status & TMIO_MASK_IRQ & ~host->sdcard_irq_mask;
 
 	pr_debug_status(status);
 	pr_debug_status(ireg);
 
 	/* Clear the status except the interrupt status */
-	sd_ctrl_write32(host, CTL_STATUS, TMIO_MASK_IRQ);
+	sd_ctrl_write32_as_16_and_16(host, CTL_STATUS, TMIO_MASK_IRQ);
 
 	if (__tmio_mmc_card_detect_irq(host, ireg, status))
 		return IRQ_HANDLED;
@@ -961,7 +961,7 @@ static int tmio_mmc_get_ro(struct mmc_host *mmc)
 
 	pm_runtime_get_sync(mmc_dev(mmc));
 	ret = !((pdata->flags & TMIO_MMC_WRPROTECT_DISABLE) ||
-		(sd_ctrl_read32(host, CTL_STATUS) & TMIO_STAT_WRPROTECT));
+		(sd_ctrl_read16_and_16_as_32(host, CTL_STATUS) & TMIO_STAT_WRPROTECT));
 	pm_runtime_mark_last_busy(mmc_dev(mmc));
 	pm_runtime_put_autosuspend(mmc_dev(mmc));
 
@@ -983,7 +983,7 @@ static int tmio_mmc_card_busy(struct mmc_host *mmc)
 {
 	struct tmio_mmc_host *host = mmc_priv(mmc);
 
-	return !(sd_ctrl_read32(host, CTL_STATUS2) & TMIO_STATUS2_DAT0);
+	return !(sd_ctrl_read16_and_16_as_32(host, CTL_STATUS2) & TMIO_STATUS2_DAT0);
 }
 
 static struct mmc_host_ops tmio_mmc_ops = {
@@ -1132,7 +1132,7 @@ int tmio_mmc_host_probe(struct tmio_mmc_host *_host,
 	tmio_mmc_clk_stop(_host);
 	tmio_mmc_reset(_host);
 
-	_host->sdcard_irq_mask = sd_ctrl_read32(_host, CTL_IRQ_MASK);
+	_host->sdcard_irq_mask = sd_ctrl_read16_and_16_as_32(_host, CTL_IRQ_MASK);
 	tmio_mmc_disable_mmc_irqs(_host, TMIO_MASK_ALL);
 
 	/* Unmask the IRQs we want to know about */
-- 
2.7.0

From: Jiri Pirko <jiri@resnulli.us>
Date: Fri, 8 Apr 2016 17:51:55 +0200

> Fri, Apr 08, 2016 at 05:45:20PM CEST, jiri@resnulli.us wrote:
>>From: Jiri Pirko <jiri@mellanox.com>
>>
>>Cosmetics, in preparation to sharedbuffer patchset.
> 
> Dave, I just realized there is dependency on:
> "devlink: remove implicit type set in port register" which I sent couple
> of minutes after this patchset. I can either resend in bulk, or if you
> could apply in order, that would be great.

The devlink series also lacked a header posting.  Can you just sort this
all out properly and respin everything?

Thanks.

> Thanks and sorry, owe you another beer :)

:-)

On Thu, Apr 7, 2016 at 7:32 PM, Alexander Duyck <aduyck@mirantis.com> wrote:
> This patch adds support for a feature I am calling IP ID mangling.  It is
> basically just another way of saying the IP IDs that are transmitted by the
> tunnel may not match up with what would normally be expected.  Specifically
> what will happen is in the case of TSO the IP IDs on the headers will be a
> fixed value so a given TSO will repeat the same inner IP ID value gso_segs
> number of times.
>
> Signed-off-by: Alexander Duyck <aduyck@mirantis.com>

If I'm understanding this correctly, enabling IP ID mangling will help
performance on ixgbe since it will allow it to do GSO partial instead
of plain GSO but it will hurt performance on i40e since it will drop
from TSO to plain GSO.

Assuming that's right, it seems like it will make it hard to chose the
right setting without knowledge of which hardware is in use. I guess
what we really want is "I care about nicely incrementing IP IDs" vs.
"I don't care as long as the DF bit is set". That second case is
really what this flag is trying to say but it seems like it is
enforcing too much in the i40e case - I don't think anyone wants to go
out of their way to make IP IDs jump around if incrementing is faster.

On Friday 19 Feb 2016 11:59:40 Marc Zyngier wrote:
> On 19/02/16 09:18, Linus Walleij wrote:
> > Top-quoting so everyone on the new To:-line gets the context.
> > 
> > I definately need an indication from an irqchip maintainer like tglx or
> > Marc Z before I merge this. Also, as in reply to the previous letter,
> > coordinate efforts with Jon Hunters similar problem space.
> 
> Seems pretty straightforward to me.
>
> Acked-by: Marc Zyngier <marc.zyngier@arm.com>

Too straightforward to be correct :-/

[    6.232681] BUG: sleeping function called from invalid context at /home/laurent/src/iob/renesas/linux/drivers/base/power/runtime.c:955
[    6.244795] in_atomic(): 1, irqs_disabled(): 128, pid: 658, name: udevd
[    6.251429] CPU: 3 PID: 658 Comm: udevd Tainted: P                4.6.0-rc3 #756
[    6.258844] Hardware name: Generic R8A7790 (Flattened Device Tree)
[    6.265036] Backtrace: 
[    6.267535] [<c0014c98>] (dump_backtrace) from [<c0014fb0>] (show_stack+0x20/0x24)
[    6.275124]  r6:00000000 r5:00000000 r4:60000093 r3:00000000
[    6.280850] [<c0014f90>] (show_stack) from [<c01f614c>] (dump_stack+0x8c/0xac)
[    6.288105] [<c01f60c0>] (dump_stack) from [<c00510c8>] (___might_sleep+0x100/0x158)
[    6.295863]  r5:000003bb r4:c06ca340
[    6.299474] [<c0050fc8>] (___might_sleep) from [<c005118c>] (__might_sleep+0x6c/0xa8)
[    6.307317]  r4:c05b6a24
[    6.309880] [<c0051120>] (__might_sleep) from [<c02d971c>] (__pm_runtime_resume+0x98/0xa0)
[    6.318159]  r6:000000dc r5:00000004 r4:ea280010
[    6.322831] [<c02d9684>] (__pm_runtime_resume) from [<c02282c8>] (gpio_rcar_irq_request_resources+0x2c/0x34)
[    6.332674]  r7:00000000 r6:000000dc r5:e95b3c00 r4:e99f3c00
[    6.338397] [<c022829c>] (gpio_rcar_irq_request_resources) from [<c0077a88>] (__setup_irq+0x24c/0x5dc)
[    6.347724] [<c007783c>] (__setup_irq) from [<c0077ff4>] (request_threaded_irq+0xdc/0x180)
[    6.356004]  r10:bf0aabc8 r9:000000dc r8:e9bc3000 r7:c0075be8 r6:e99f3c00 r5:00002003
[    6.363905]  r4:e95b3c00
[    6.366466] [<c0077f18>] (request_threaded_irq) from [<c007a758>] (devm_request_threaded_irq+0x6c/0xac)
[    6.375874]  r10:ea2db810 r9:ea2db810 r8:00000000 r7:bf0aabc8 r6:000000dc r5:e9bc3000
[    6.383773]  r4:e95b3b50 r3:00002003
[    6.387410] [<c007a6ec>] (devm_request_threaded_irq) from [<bf0aab9c>] (mmc_gpiod_request_cd_irq+0xa4/0xd0 [mmc_core])
[    6.398121]  r10:ea2db800 r8:e9bc3000 r7:e9bed598 r6:000000dc r5:e9bed524 r4:e9bc3000
[    6.406065] [<bf0aaaf8>] (mmc_gpiod_request_cd_irq [mmc_core]) from [<bf09f3bc>] (mmc_start_host+0x70/0x90 [mmc_core])
[    6.416779]  r6:e9bc3300 r5:00000000 r4:e9bc3000
[    6.421476] [<bf09f34c>] (mmc_start_host [mmc_core]) from [<bf0a061c>] (mmc_add_host+0x54/0x78 [mmc_core])
[    6.431146]  r4:e9bc3000 r3:00000001
[    6.434782] [<bf0a05c8>] (mmc_add_host [mmc_core]) from [<bf134b3c>] (tmio_mmc_host_probe+0x3ac/0x450 [tmio_mmc_core])
[    6.445498]  r5:ffffffe0 r4:00000000
[    6.449119] [<bf134790>] (tmio_mmc_host_probe [tmio_mmc_core]) from [<bf1501e8>] (sh_mobile_sdhi_probe+0x198/0x414 [sh_mobile_sdhi])
[    6.461051]  r10:bf150d04 r9:e9bed598 r8:00000001 r7:ea2db810 r6:ea2db800 r5:e9bc3300
[    6.468958]  r4:e9bed590
[    6.471532] [<bf150050>] (sh_mobile_sdhi_probe [sh_mobile_sdhi]) from [<c02cf220>] (platform_drv_probe+0x60/0xc0)
[    6.481811]  r10:00000011 r9:00000000 r8:bf151464 r7:bf151464 r6:fffffdfb r5:ea2db810
[    6.489712]  r4:00000000
[    6.492271] [<c02cf1c0>] (platform_drv_probe) from [<c02ccf80>] (driver_probe_device+0x224/0x440)
[    6.501156]  r7:c06c45f8 r6:c08e2b44 r5:c08e2b3c r4:ea2db810
[    6.506878] [<c02ccd5c>] (driver_probe_device) from [<c02cd2a0>] (__driver_attach+0x104/0x128)
[    6.515508]  r10:00000000 r9:bf1514c0 r8:c06c4520 r7:00000000 r6:bf151464 r5:ea2db810
[    6.523411]  r4:ea2db844
[    6.525965] [<c02cd19c>] (__driver_attach) from [<c02cae04>] (bus_for_each_dev+0x64/0x98)
[    6.534156]  r6:c02cd19c r5:bf151464 r4:00000000 r3:00000000
[    6.539874] [<c02cada0>] (bus_for_each_dev) from [<c02cc5e4>] (driver_attach+0x2c/0x30)
[    6.547895]  r6:c06ace08 r5:ea294c80 r4:bf151464
[    6.552561] [<c02cc5b8>] (driver_attach) from [<c02cc264>] (bus_add_driver+0x18c/0x268)
[    6.560586] [<c02cc0d8>] (bus_add_driver) from [<c02cdf90>] (driver_register+0x88/0x104)
[    6.568691]  r8:bf153000 r7:00000001 r6:e9ba7a40 r5:c067cfc8 r4:bf151464
[    6.575464] [<c02cdf08>] (driver_register) from [<c02cef80>] (__platform_driver_register+0x50/0x54)
[    6.584523]  r5:c067cfc8 r4:c067cfc8
[    6.588141] [<c02cef30>] (__platform_driver_register) from [<bf153018>] (sh_mobile_sdhi_driver_init+0x18/0x24 [sh_mobile_sdhi])
[    6.599654] [<bf153000>] (sh_mobile_sdhi_driver_init [sh_mobile_sdhi]) from [<c000a884>] (do_one_initcall+0xc0/0x200)
[    6.610292] [<c000a7c4>] (do_one_initcall) from [<c00ccd28>] (do_init_module+0x70/0x1dc)
[    6.618398]  r10:000005fa r9:bf1514c0 r8:c00a1f28 r7:00000001 r6:e94f3fc0 r5:00000001
[    6.626299]  r4:bf1514c0
[    6.628860] [<c00cccb8>] (do_init_module) from [<c00a5368>] (load_module+0x19c8/0x2164)
[    6.636878]  r7:00000001 r6:e955ec00 r5:00000001 r4:e9b73f3c
[    6.642603] [<c00a39a0>] (load_module) from [<c00a5d38>] (SyS_finit_module+0xb0/0xe0)
[    6.650447]  r10:00000000 r9:e9b72000 r8:b6f75330 r7:00000009 r6:00000000 r5:00000000
[    6.658342]  r4:7fffffff
[    6.660901] [<c00a5c88>] (SyS_finit_module) from [<c0011940>] (ret_fast_syscall+0x0/0x34)
[    6.669093]  r8:c0011ae4 r7:0000017b r6:00000000 r5:00000000 r4:00020000

The .irq_request_resources() handler is called with a spinlock held, it thus
can't call the synchronous version of the PM runtime functions.

-- 
Regards,

Laurent Pinchart

Enables PWM1 (brightness control) and PWM2 (PMIC switching frequency
synchronization).

Signed-off-by: Ulrich Hecht <ulrich.hecht+renesas@gmail.com>
Acked-by: Geert Uytterhoeven <geert+renesas@glider.be>

---
arch/arm64/boot/dts/renesas/r8a7795-salvator-x.dts | 23 ++++++++++++++++++++++
 1 file changed, 23 insertions(+)

diff --git a/arch/arm64/boot/dts/renesas/r8a7795-salvator-x.dts b/arch/arm64/boot/dts/renesas/r8a7795-salvator-x.dts
index 507d6a4..5525637 100644
--- a/arch/arm64/boot/dts/renesas/r8a7795-salvator-x.dts
+++ b/arch/arm64/boot/dts/renesas/r8a7795-salvator-x.dts
@@ -189,6 +189,15 @@
 	pinctrl-0 = <&scif_clk_pins>;
 	pinctrl-names = "default";
 
+	pwm1_pins: pwm1 {
+		renesas,groups = "pwm1_a";
+		renesas,function = "pwm1";
+	};
+	pwm2_pins: pwm2 {
+		renesas,groups = "pwm2_a";
+		renesas,function = "pwm2";
+	};
+
 	scif1_pins: scif1 {
 		renesas,groups = "scif1_data_a", "scif1_ctrl";
 		renesas,function = "scif1";
@@ -299,6 +308,20 @@
 	};
 };
 
+&pwm1 {
+	/* brightness control */
+	pinctrl-0 = <&pwm1_pins>;
+	pinctrl-names = "default";
+	status = "okay";
+};
+
+&pwm2 {
+	/* PMIC DC/DC switching frequency synchronization */
+	pinctrl-0 = <&pwm2_pins>;
+	pinctrl-names = "default";
+	status = "okay";
+};
+
 &rcar_sound {
 	pinctrl-0 = <&sound_pins &sound_clk_pins>;
 	pinctrl-names = "default";
