Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.169
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793401619;
	b=Zh+t2DrUAblqbOw7T7pw8u8kq2VdO0H0t5x6+1K4KrFyB3B9c58Ho5peLzmTsWNq8u5g
	 UaAV12bKj6EcWCiQtZgg9HaDg0sVIcSD9gYi2h2cZLDbG97vSsk2Mpo7pVf5zxOYXEHMP
	 mbGoU5CmBsU2D9vHxGv3bNK+3EEkO4RFUVaZxeJpGlHA7LBHtIExz4vTRRncK+3EgZZjB
	 IxxT6OfC3cTzghCg0xygGt4FsgxnIsPTQLOzDZSGUuT3pPlYAtu6zkNNKI4nsY/n0kzqa
	 5/ihruH/FXo4Jh2NedG+GURk6TlM1IP/3aGyM8i/X0Eqf4zCD8/IMVQstgkf8aGDatw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793401619;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=jkr/MExl/h9Ffvm2Dl+YvUyWJ/qkIg+g22Ak07CjG0w=;
	b=ro5twoD1U6d8qFGST1NScoUJlYg+R/6JOEIP2kob3xPEQanvrGblIMniAWkqttBmjY7p
	 6NSHqkACcdClDZedThTGmACaePsu5sIXOHL0XopaYgxPi6n2z6aUyzGOigr1eEqGdsYmH
	 EXJhdwrMPaDLhXgPdYtT+ykUhdW0Ta+fufYuI1ZMjJ69eCxdoZt2qGjj6luE5XPi9FQbm
	 4HGVmY6xXPg8yFCo7orSKVnidEg/tbX4WMJIgKYUp0Sjc3wkpCsNI1anVbrZDl9yk9BgN
	 xUW3b7bIvkswPBxaZP/+GSlcH2UruIApgZj1DvVP55GxQm4vF9o/KNjyirIv0RHUiDg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ocjQ8Qvc;
	arc=none smtp.remote-ip=209.85.215.169
Received: from mail-pg1-f169.google.com (mail-pg1-f169.google.com [209.85.215.169])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A8E4B606A31D
	for <linux-renesas-soc@vger.kernel.org>; Fri, 30 Oct 2026 23:06:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A8E4B606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ocjQ8Qvc
Received: by mail-pg1-f169.google.com with SMTP id 41be03b00d2f7-cdab9e9761cso737828a12.2
        for <linux-renesas-soc@vger.kernel.org>; Fri, 30 Oct 2026 16:06:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793401618; x=1794006418; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=jkr/MExl/h9Ffvm2Dl+YvUyWJ/qkIg+g22Ak07CjG0w=;
        b=ocjQ8QvcY4R3WIfeNPMNfGN0d5jvGeV/U5kWwLjZs4mzmjQuyREQ0bbe5Aw8eBduWQ
         BkmO2bEvGTQI7Wmk0L8uEfOFv2WOgj2kJ9l4xqqQE+XAl13jNPBgADnh41lpWJxZbN+B
         GWWFvl2VfIZaGwgnTKSYLcH3SFAvwMZ3jn4ZYUYa2cyVV5AMfd366C3bNWLH/RVlVaqy
         7igXKWWmmcNl7CxqvdAoq+ZF3jBVTjYO+EJ2RPpDL9NXCvlG/4hj1JtETmwqAsHqoxTb
         dVtYjvF3nYzCTO5B5wNs6jLX2fExKflCdx1pU/o4TgNwJjbUyP0t2qRhyVGp+8aG15ax
         8Ang==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793401618; x=1794006418;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=jkr/MExl/h9Ffvm2Dl+YvUyWJ/qkIg+g22Ak07CjG0w=;
        b=WpQsx1Lmehn1jfgD0zHGU9Tbgk0YqM4oDimItmMW4JJSeT+69SJIPKBj+9Hqnf0HrV
         3pmKtc9cWbXVaUonzoK43D9nMWVf47y41NGzWUhcxdCrW0UwAaCnCE9KTa/nYGB/LfB+
         Of/x+2Yi61iwj7jPqfttOm3TghAh8op3yJIPC+pHlXNuIAa5CoOqYmgZUZlCxgmiTnsg
         k6XvdrJm3c3Azqkii4aqw89sXsM0tGlRIsi0si/zBLlFF20EK/kdav9lUea9Vecg3ERk
         YrOv09+C0GrHMeXY+4c0iVa3mcwr+C5/Bcxwwoh75A3F0WJjlONLypLu1dfo0AS2JXl5
         rqVQ==
X-Forwarded-Encrypted: i=1; AKwUvBxxD+1axv/GiGHN61tS5v0OP6LVkPu/pxFCQlv1STI5dpDtqc2RuWQcXAT/ui0cI+2NUNo/REYWfDkFs2MXC133Kw==@vger.kernel.org
X-Gm-Message-State: AFq9FYIYf5dVfAJqPc75e7Hgk3iNYXkW077ep9sxbnflsxmONSvzJxvv
	SPoX9kq/UPbTFbNZ/W+jDg74rZ42H2CxqGxegLKjH+Ua4yCxhQ+vPFXx
X-Gm-Gg: AYBFou3DWOmhWieblaFUs74JERB0NjnzP8DYhH/WOB0h5yagXWfWVabFix9YyU2sSSZ
	WLiIu/a65DVI5rh2cQJjZ2hd5LGUMSNtx7gEjVhPAJ3qI1T/UltMEPBUMFEcujXHfc66VUqVqz6
	F3igo+IONTzb1wqhk4smZztlZiTtMSg3fUoGJD9zqP3adx7BRpxldKnb2JEvfl3Qf57AJDTFUMn
	eMQgxKFYC38HLXUNRGjc/6TIzBHXEoJIr31oXu+EhC3wDPofFvFx5UTd6UcKNfpJLHeULlbsGRs
	RlotEW3wTypfF8im1758bd13jACN6onpZRgSOl18VTRfW83RVip9IlFflSCNsw556sjwy1L6Llu
	PexNTOPLqRNuW5E0avr6Se8uwH3ONxRswJQGix/4l6zsJ6D2MENo9v+ZOokwdIhl1HZFYhmRHx5
	CReN6Z+0OZZHR9UtPAv5Ub/Fpen0hkePUawNX7zDqNlyIyPr5lUgLPNoHKgoXFtOh0O/0ScqUXm
	5pnVh2vQiwd0f7akWVQzEFZKrWYSiSnE39FrwJgiZs+dnOTtMAviOYAJpgP3Teek0S+v+pu/zvZ
	d32J9TndHiM31jcPAc4b8Ya2iTfPj3KdtdaqLjx54bxQNIYTD87m3k3lNt0l7S+YauUy9YnWW1z
	zT6CjeRfs
X-Received: by 2002:a17:90b:268d:b0:3a5:147a:3b63 with SMTP id 98e67ed59e1d1-3ae895a5bdemr2863341a91.8.1793401617933;
        Fri, 30 Oct 2026 16:06:57 -0700 (PDT)
Received: from archlinux (d173-183-236-7.abhsia.telus.net. [173.183.236.7])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ae845aa27esm5322736a91.11.2026.10.30.16.06.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Oct 2026 16:06:57 -0700 (PDT)
From: Artem Novak <artem122novak@gmail.com>
To: glaubitz@physik.fu-berlin.de,
	dalias@libc.org
Cc: geert+renesas@glider.be,
	magnus.damm@gmail.com,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	linux-sh@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Artem Novak <artem122novak@gmail.com>
Subject: [PATCH v2] sh: sh7305: add TMU0 clock support
Date: Fri, 30 Oct 2026 17:06:46 -0600
Message-ID: <20261030230646.709687-1-artem122novak@gmail.com>
X-Mailer: git-send-email 2.56.0
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Post: <mailto:linux-renesas-soc@vger.kernel.org>
List-Help: <mailto:linux-renesas-soc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-renesas-soc+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Register the SH7305 master, peripheral, bus and CPU clocks using
the SuperH clock framework. Add the TMU0 module clock gate using
MSTPCR0 bit 15.

Keeping SH7305 clock initialization independent of the legacy CPG
initialization framework, which relies on arch_init_clk_ops().
Disable SH_CLK_CPG_LEGACY for SH7305.

update: SH7305 TMU device tree node will use the
renesas,tmu-sh7305 compatible.

Signed-off-by: Artem Novak <artem122novak@gmail.com>
---
 arch/sh/Kconfig                        |  2 +-
 arch/sh/boot/dts/sh7305.dtsi           |  2 +-
 arch/sh/kernel/cpu/sh4a/clock-sh7305.c | 78 +++++++++++++++++++-------
 3 files changed, 60 insertions(+), 22 deletions(-)

diff --git a/arch/sh/Kconfig b/arch/sh/Kconfig
index 5ce7df11c3ec..315a1d6ee452 100644
--- a/arch/sh/Kconfig
+++ b/arch/sh/Kconfig
@@ -532,7 +532,7 @@ config SH_CLK_CPG
 	def_bool y
 
 config SH_CLK_CPG_LEGACY
-	depends on SH_CLK_CPG
+	depends on SH_CLK_CPG && !CPU_SUBTYPE_SH7305
 	def_bool y if !CPU_SUBTYPE_SH7785 && !ARCH_SHMOBILE && \
 		      !CPU_SHX3 && !CPU_SUBTYPE_SH7757 && \
 		      !CPU_SUBTYPE_SH7734 && !CPU_SUBTYPE_SH7264 && \
diff --git a/arch/sh/boot/dts/sh7305.dtsi b/arch/sh/boot/dts/sh7305.dtsi
index e7dd8b15445d..501b166554b0 100644
--- a/arch/sh/boot/dts/sh7305.dtsi
+++ b/arch/sh/boot/dts/sh7305.dtsi
@@ -30,7 +30,7 @@ intc: interrupt-controller {
 	 * hardware. Clock provider integration is still required.
 	 */
 	tmu0: timer@a4490000 {
-		compatible = "renesas,sh7305-tmu", "renesas,tmu";
+		compatible = "renesas,tmu-sh7305", "renesas,tmu";
 		reg = <0xa4490000 0x2c>;
 		interrupts = <0x400>, <0x420>, <0x440>;
 		interrupt-names = "tuni0", "tuni1", "tuni2";
diff --git a/arch/sh/kernel/cpu/sh4a/clock-sh7305.c b/arch/sh/kernel/cpu/sh4a/clock-sh7305.c
index 0e683dd6de11..03d4b5f987dd 100644
--- a/arch/sh/kernel/cpu/sh4a/clock-sh7305.c
+++ b/arch/sh/kernel/cpu/sh4a/clock-sh7305.c
@@ -7,6 +7,8 @@
 #include <linux/init.h>
 #include <linux/kernel.h>
 #include <linux/io.h>
+#include <linux/clk.h>
+#include <linux/clkdev.h>
 #include <linux/sh_clk.h>
 
 #include <asm/clock.h>
@@ -84,13 +86,13 @@ static unsigned int sh7305_divisor(unsigned int shift)
 /*
  * master_clk is the clock before the B/I/P divider stages.
  */
-static void master_clk_init(struct clk *clk)
+static unsigned long master_clk_recalc(struct clk *clk)
 {
-	clk->rate = sh7305_base_rate();
+	return sh7305_base_rate();
 }
 
 static struct sh_clk_ops sh7305_master_clk_ops = {
-	.init = master_clk_init,
+	.recalc = master_clk_recalc,
 };
 
 
@@ -140,27 +142,63 @@ static struct sh_clk_ops sh7305_cpu_clk_ops = {
 
 
 /*
- * Ordering must match arch/sh/kernel/cpu/clock-cpg.c:
- *
- *   0 master
- *   1 peripheral
- *   2 bus
- *   3 cpu
+ * SH7305 main clocks.
  */
-static struct sh_clk_ops *sh7305_clk_ops[] = {
-	&sh7305_master_clk_ops,
-	&sh7305_peripheral_clk_ops,
-	&sh7305_bus_clk_ops,
-	&sh7305_cpu_clk_ops,
+static struct clk master_clk = {
+	.ops		= &sh7305_master_clk_ops,
+	.flags		= CLK_ENABLE_ON_INIT,
 };
 
-void __init arch_init_clk_ops(struct sh_clk_ops **ops, int idx)
-{
-	if (idx < ARRAY_SIZE(sh7305_clk_ops))
-		*ops = sh7305_clk_ops[idx];
-}
+static struct clk peripheral_clk = {
+	.ops		= &sh7305_peripheral_clk_ops,
+	.parent		= &master_clk,
+	.flags		= CLK_ENABLE_ON_INIT,
+};
+
+static struct clk bus_clk = {
+	.ops		= &sh7305_bus_clk_ops,
+	.parent		= &master_clk,
+	.flags		= CLK_ENABLE_ON_INIT,
+};
+
+static struct clk cpu_clk = {
+	.ops		= &sh7305_cpu_clk_ops,
+	.parent		= &master_clk,
+	.flags		= CLK_ENABLE_ON_INIT,
+};
+
+static struct clk *main_clks[] = {
+	&master_clk,
+	&peripheral_clk,
+	&bus_clk,
+	&cpu_clk,
+};
+
+#define MSTPCR0		0xa4150030
+
+static struct clk mstp_clks[] = {
+	SH_CLK_MSTP32(&peripheral_clk, MSTPCR0, 15, 0),
+};
+
+static struct clk_lookup lookups[] = {
+	CLKDEV_CON_ID("master_clk", &master_clk),
+	CLKDEV_CON_ID("peripheral_clk", &peripheral_clk),
+	CLKDEV_CON_ID("bus_clk", &bus_clk),
+	CLKDEV_CON_ID("cpu_clk", &cpu_clk),
+	CLKDEV_ICK_ID("fck", "sh-tmu.0", &mstp_clks[0]),
+};
 
 int __init arch_clk_init(void)
 {
-	return cpg_clk_init();
+	int i, ret = 0;
+
+	for (i = 0; !ret && i < ARRAY_SIZE(main_clks); i++)
+		ret = clk_register(main_clks[i]);
+
+	if (ret)
+		return ret;
+
+	clkdev_add_table(lookups, ARRAY_SIZE(lookups));
+
+	return sh_clk_mstp_register(mstp_clks, ARRAY_SIZE(mstp_clks));
 }
-- 
2.56.0

