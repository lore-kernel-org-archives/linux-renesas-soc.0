Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 41C9F1DF73C
	for <linux-renesas-soc@vger.kernel.org>; Wed,  3 Jun 2026 15:10:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780499419; cv=none; b=jSSjlVY2PC6X793+a0w1aPF5HR20XzBNrhX/cAueAPEVr7NKI7tc0lo6QLt0lbQnE/NBgZCKAP0DF/aVVy8irHkw8pyEOK6TgfYNUqELXkW7zmMXz/G8JO93Tpo00PewYsBcrGzyangcdz0jCfgYGFBIUE6VJALLystAv+qXcP4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780499419; c=relaxed/simple;
	bh=rRwLrWm30JrnWZVi32qF/VnDPxcJWOVwoyP8I0XxdlE=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=p00xmxIIKOunQ4mAglPldcBZuLFLlhcyjx5Rf6fRxSNNkIVY5U3SIpuIqfkmRCNFy4azIuwRw/s1dYM1QsJ6mFEseC6G298h4xDkUlyaNu1uHkrVcRTOq60wjlyNcbJ3ElDMmyNgSRXLvIyGFf6qYzMO96iixTCa3YEPNGgGQ/U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0FF011F00893;
	Wed,  3 Jun 2026 15:10:16 +0000 (UTC)
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: Magnus Damm <magnus.damm@gmail.com>,
	linux-arm-kernel@lists.infradead.org
Cc: linux-renesas-soc@vger.kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH] ARM: shmobile: rcar-gen2: Use of_machine_compatible_match() helper
Date: Wed,  3 Jun 2026 17:10:14 +0200
Message-ID: <2230eb28da9b8d8bdee4e4fd7e19dc8f074531bc.1780499233.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Replace sequences of of_machine_is_compatible() calls by single calls to
the of_machine_compatible_match() helper, to simplify the code, and to
reduce code size.

Note that this does have a slight performance impact on matching
platforms: while the C sequences terminated evaluation after a match,
(internal) of_device_compatible_match() calculates a matching score, and
thus always checks against all passed compatible values.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
To be queued in renesas-devel for v7.3.

 arch/arm/mach-shmobile/regulator-quirk-rcar-gen2.c | 10 +++++-----
 arch/arm/mach-shmobile/setup-rcar-gen2.c           |  9 +++++----
 2 files changed, 10 insertions(+), 9 deletions(-)

diff --git a/arch/arm/mach-shmobile/regulator-quirk-rcar-gen2.c b/arch/arm/mach-shmobile/regulator-quirk-rcar-gen2.c
index 747a96c58df15075..647e5f9f6aa8ba40 100644
--- a/arch/arm/mach-shmobile/regulator-quirk-rcar-gen2.c
+++ b/arch/arm/mach-shmobile/regulator-quirk-rcar-gen2.c
@@ -140,6 +140,10 @@ static struct notifier_block regulator_quirk_nb = {
 
 static int __init rcar_gen2_regulator_quirk(void)
 {
+	static const char *const boards[] __initconst = {
+		"renesas,koelsch", "renesas,lager", "renesas,porter",
+		"renesas,stout", "renesas,gose", NULL
+	};
 	struct regulator_quirk *quirk, *pos, *tmp;
 	struct of_phandle_args *args;
 	const struct of_device_id *id;
@@ -147,11 +151,7 @@ static int __init rcar_gen2_regulator_quirk(void)
 	u32 mon, addr;
 	int ret;
 
-	if (!of_machine_is_compatible("renesas,koelsch") &&
-	    !of_machine_is_compatible("renesas,lager") &&
-	    !of_machine_is_compatible("renesas,porter") &&
-	    !of_machine_is_compatible("renesas,stout") &&
-	    !of_machine_is_compatible("renesas,gose"))
+	if (!of_machine_compatible_match(boards))
 		return -ENODEV;
 
 	for_each_matching_node_and_match(np, rcar_gen2_quirk_match, &id) {
diff --git a/arch/arm/mach-shmobile/setup-rcar-gen2.c b/arch/arm/mach-shmobile/setup-rcar-gen2.c
index 3cd34a42e39bb1d7..5145589059191a96 100644
--- a/arch/arm/mach-shmobile/setup-rcar-gen2.c
+++ b/arch/arm/mach-shmobile/setup-rcar-gen2.c
@@ -56,6 +56,10 @@ static unsigned int __init get_extal_freq(void)
 
 static void __init rcar_gen2_timer_init(void)
 {
+	static const char *const fixed_freq_socs[] __initconst = {
+		"renesas,r8a7745", "renesas,r8a77470", "renesas,r8a7792",
+		"renesas,r8a7794", NULL
+	};
 	bool need_update = true;
 	void __iomem *base;
 	u32 freq;
@@ -76,10 +80,7 @@ static void __init rcar_gen2_timer_init(void)
 
 	secure_cntvoff_init();
 
-	if (of_machine_is_compatible("renesas,r8a7745") ||
-	    of_machine_is_compatible("renesas,r8a77470") ||
-	    of_machine_is_compatible("renesas,r8a7792") ||
-	    of_machine_is_compatible("renesas,r8a7794")) {
+	if (of_machine_compatible_match(fixed_freq_socs)) {
 		freq = 260000000 / 8;	/* ZS / 8 */
 	} else {
 		/* At Linux boot time the r8a7790 arch timer comes up
-- 
2.43.0

