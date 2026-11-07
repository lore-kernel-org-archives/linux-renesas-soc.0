Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.160.50
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794082458;
	b=SN621rGDiow4dHQE+tjdv+BvFSNzEy7bNUJ8Nv0H8qsqzDqey7mwmoXISr1WhNxQLTuM
	 zpvQUicG2nTq0/tHDyCv4CHxt1cHL7Y4wX8KNszHA0pA5OkglZ/RyDFJYxQi5venD7xoa
	 1SPFySb6byg7g8YIb+Z1cc1X/FCw6dQeu7t7+wjqJI3ejjRfufuv5as87PQhc0ycg1seh
	 qYn89Yukq8x0DusofH5ODAmAK5itl11do2Tpb3NdGZR36/RrP6tvPafEZQVWMP2YwKrk5
	 Oidyn0B9fqLNcfYqkV/+E366XzAzdx/1C3253+3v66nPxDlfeLhKvPUF+ls0tAfzGfw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794082458;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:Date:Subject:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:
	 References:In-Reply-To:To:Cc:X-Mailer;
	bh=LtFKBRAqbAaZtxAu1Nw6aaS7lLmmzcUOPw2XCvAi+f0=;
	b=A1dauBtEq4NgtQk/PqvL2vv7LZRpqpCqQ9lR3EzPawY8UDUiF7zVlYcnTsPna/a88+1U
	 5LTbIENFl2Em6ua3ICGmV7/6B+lOQqpi6z0f/YcjGfDFxwQFTRd6M1LJkSLlbE2Hb0UVC
	 Nk2MXBZgSFRviLhFjFcMu6WiRdwlEJOevT7Ej2+VDN7giqjY0qQJjsduajpGvBObPRhOB
	 xktF34OwzoFN8XOwBhx8N1GCvqosoQ4M+IbYFLD3ywh50poV8kdan8V7EYEjAV8OUw9jg
	 DCzkjHXpUCjfLC32mKFqEt4m6NyKi/o3LYi6vc2ddkZZ+h/X9EIMzZxY3r+qU8suJdw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=fail header.from=gmail.com;
	spf=pass smtp.mailfrom=upstreamdata.ca;
	arc=none smtp.remote-ip=209.85.160.50
Received: from mail-oa1-f50.google.com (mail-oa1-f50.google.com [209.85.160.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 60E8E6082BEC
	for <linux-renesas-soc@vger.kernel.org>; Sat,  7 Nov 2026 20:14:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 60E8E6082BEC
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=upstreamdata.ca
Received: by mail-oa1-f50.google.com with SMTP id 586e51a60fabf-483d290f398so4312fac.2
        for <linux-renesas-soc@vger.kernel.org>; Sat, 07 Nov 2026 12:14:18 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794082457; x=1794687257;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=LtFKBRAqbAaZtxAu1Nw6aaS7lLmmzcUOPw2XCvAi+f0=;
        b=W53UhXZJTbKXOZtcg/tCE686B1jjuGErW2DVOaV57VmNUvBvzjaM1U6rWwIL+QLEa4
         TqI1UIROW6khxcjo66nCD2frSNT+oF6++rRMv1OcFO3cnq6pUuISHGmmuLyEX08fbMmf
         S5uTvzUzfR0Z9nBZSqAYAPQipcC1q60QzT1l4SfYKX4AlHKZxA5c234YoMdie9iOQ7xA
         MIjng/fySwhkEMVQf74rtdlop/k8WwJ7EBsLrysJ3hOIAuB21R3MNqI26aZg5tN/f6au
         ZYqRQUddbot3a6u3ShyVRJ1KjJqY6ykfJlgj/SK2MyA9oojDw1Q06Z7zxB7Bf+TIA41O
         JuNQ==
X-Forwarded-Encrypted: i=1; AL+hErG0+hHyOpB54oKKD5+tfyGjyb8bd1H7AaGqxERrEozGOTEWB3tQEdf361hW+A76M9wtZo+gHgecI/hNPypbFPV51Q==@vger.kernel.org
X-Gm-Message-State: APuU4Z/SK5RwUmsOaIb5NveAm1Y2B85hmLlt14fqXY/oHEijRcYh6q1O
	nlIMlMJ4ft2t+9RPO6naQ+sxCMhsDOYYGPAZuzLjJnzjPPPYucG+xCadC2sik3B6PlI=
X-Gm-Gg: AYBFou01p2YWAkl/yLkuxg0OHVX8uE01/ucsWBuG10AloIkV1gobp8drImfoOvRmodE
	tDftnVopjSg8OfwgAcQ1oK1kmjxv/DEukf6BeSpTmgjsDtjA8fKcAg0NEStpGKoIiXSAJxzDoJF
	MxpGj++xPuPh3yMlwKMyf4FbQ6D/GpSfuhcKnUpT3igkjg2ZnslV2WaiKbiz/JclStf5FLHo1mf
	nHyyaiP1nZXgu7rG/Eo2jzTgmgE5fZ3nJs3zOXFL3AzOAYWFVKll1eMIe5Ly450YdOKxOqcd4cU
	y1DVl7R+26L58W50/zo5O5yzGZOhunOWS1ih2FAlsZjJF7tiUNneLs48LiU/fC7bU9Y8u1HYlju
	rYL6bRqrHU8TyAUS1Zvs6nd+EG0aE9XgQQOBOz3qQCfmjArL0WhMHtMhqiW9lAsRh/n7CeJta3P
	gZo65G3jzH0g4/w/uI/uN2+TYzp96ExTMufQojhfuFB1HjmztZMLNePTMA8+e41+nDqeVj4bDpr
	YfU3apBJ7GXTXZkmiuGgxjEUFMmqgXMGQ7Y5mDo1XtMRedbNeklTHVkcmXqOTa3xTLMpLtdH6va
	4nqTnwHtjXHrgHaLw/tRnmrUH9ESdf7EWye5/SYjGJhZLdH39J+AinLQ7k0J0u9oTq8G9uIcLnG
	LxehskA==
X-Received: by 2002:a05:6871:438b:b0:4ad:73bd:91b3 with SMTP id 586e51a60fabf-4ad98aab859mr3931286fac.9.1794082457245;
        Sat, 07 Nov 2026 12:14:17 -0800 (PST)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-4ade68aa561sm226096fac.5.2026.11.07.12.14.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 07 Nov 2026 12:14:16 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Sat, 07 Nov 2026 03:16:53 -0700
Subject: [PATCH 56/58] mtd: rawnand: nandsim: retain chip state across
 removal
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Post: <mailto:linux-renesas-soc@vger.kernel.org>
List-Help: <mailto:linux-renesas-soc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-renesas-soc+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261107-submit-rawnand-retained-handle-lifetime-v1-v1-56-0181ef0cc4c8@gmail.com>
References: <20261107-submit-rawnand-retained-handle-lifetime-v1-v1-0-0181ef0cc4c8@gmail.com>
In-Reply-To: <20261107-submit-rawnand-retained-handle-lifetime-v1-v1-0-0181ef0cc4c8@gmail.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>,
  Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
  Brian Norris <computersforpeace@gmail.com>,
  Boris Brezillon <bbrezillon@kernel.org>,
  Arseniy Krasnov <AVKrasnov@sberdevices.ru>, Chen-Yu Tsai <wens@kernel.org>,
  Jernej Skrabec <jernej.skrabec@gmail.com>,
  Samuel Holland <samuel@sholland.org>, Thomas Gleixner <tglx@kernel.org>,
  Vitaly Wool <vitalywool@gmail.com>, David Woodhouse <dwmw2@infradead.org>,
  Russell King <rmk+kernel@arm.linux.org.uk>,
  David Woodhouse <David.Woodhouse@intel.com>,
  Mike Rapoport <rppt@kernel.org>,
  Maxime Coquelin <mcoquelin.stm32@gmail.com>,
  Alexandre Torgue <alexandre.torgue@foss.st.com>,
  Christophe Kerello <christophe.kerello@st.com>,
  Jason Roberts <jason.e.roberts@intel.com>,
  Michal Simek <michal.simek@amd.com>,
  Boris Brezillon <boris.brezillon@collabora.com>,
  Mason Yang <masonccyang@mxic.com.tw>,
  Ramuthevar Vadivel Murugan <vadivel.muruganx.ramuthevar@linux.intel.com>,
  Stefan Agner <stefan@agner.ch>, Lucas Stach <dev@lynxeye.de>,
  Thierry Reding <thierry.reding@kernel.org>,
  Jonathan Hunter <jonathanh@nvidia.com>, Dmitry Osipenko <digetx@gmail.com>,
  Matthias Brugger <matthias.bgg@gmail.com>,
  AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
  Jorge Ramirez-Ortiz <jorge.ramirez@oss.qualcomm.com>,
  Heiko Stuebner <heiko@sntech.de>, Yifeng Zhao <yifeng.zhao@rock-chips.com>,
  Nicolas Ferre <nicolas.ferre@microchip.com>,
  Alexandre Belloni <alexandre.belloni@bootlin.com>,
  Claudiu Beznea <claudiu.beznea@tuxon.dev>,
  Keguang Zhang <keguang.zhang@gmail.com>, Jacky Huang <ychuang3@nuvoton.com>,
  Shan-Chun Hung <schung@nuvoton.com>, Frank Li <Frank.Li@nxp.com>,
  Sascha Hauer <s.hauer@pengutronix.de>,
  Pengutronix Kernel Team <kernel@pengutronix.de>,
  Fabio Estevam <festevam@gmail.com>, Han Xu <han.xu@nxp.com>,
  Liang Yang <liang.yang@amlogic.com>,
  Neil Armstrong <neil.armstrong@linaro.org>,
  Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>,
  Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
  Manivannan Sadhasivam <mani@kernel.org>,
  Kamal Dasu <kamal.dasu@broadcom.com>,  Broadcom internal kernel review list
 <bcm-kernel-feedback-list@broadcom.com>,  Vladimir Zapolskiy <vz@mleia.com>,
  Piotr Wojtaszczyk <piotr.wojtaszczyk@timesys.com>,
  Paul Cercueil <paul@crapouillou.net>,
  Harvey Hunt <harveyhuntnexus@gmail.com>,
  Maxim Levitsky <maximlevitsky@gmail.com>, Michael Walle <michael@walle.cc>,
  Srinivas Kandagatla <srini@kernel.org>
Cc: Tze Yee Ng <tze.yee.ng@altera.com>, linux-mtd@lists.infradead.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-sunxi@lists.linux.dev, linux-tegra@vger.kernel.org, 
 linux-mediatek@lists.infradead.org, linux-rockchip@lists.infradead.org, 
 linux-mips@vger.kernel.org, imx@lists.linux.dev, 
 linux-renesas-soc@vger.kernel.org, linux-amlogic@lists.infradead.org, 
 linux-arm-msm@vger.kernel.org, James Hilliard <james.hilliard1@gmail.com>
X-Mailer: b4 0.15.2

MTD device references can outlive device unregistration even when no
open file pins the simulator module. Disconnect before freeing the
simulated media, and retain the chip metadata until the final MTD put.
The lifetime core waits for remaining device references during module
unload.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 drivers/mtd/nand/raw/nandsim.c | 24 ++++++++++++++++++++----
 1 file changed, 20 insertions(+), 4 deletions(-)

diff --git a/drivers/mtd/nand/raw/nandsim.c b/drivers/mtd/nand/raw/nandsim.c
index fe968037f75a..39fefd83cd85 100644
--- a/drivers/mtd/nand/raw/nandsim.c
+++ b/drivers/mtd/nand/raw/nandsim.c
@@ -2253,6 +2253,11 @@ static const struct nand_controller_ops ns_controller_ops = {
 	.exec_op = ns_exec_op,
 };
 
+static void ns_chip_release(struct nand_chip *chip)
+{
+	kfree(nand_get_controller_data(chip));
+}
+
 /*
  * Module initialization function
  */
@@ -2262,6 +2267,7 @@ static int __init ns_init_module(void)
 	struct nand_chip *chip;
 	struct nandsim *ns;
 	int ret;
+	bool retained = false;
 
 	if (bus_width != 8 && bus_width != 16) {
 		NS_ERR("wrong bus width (%d), use only 8 or 16\n", bus_width);
@@ -2376,6 +2382,10 @@ static int __init ns_init_module(void)
 	ret = ns_parse_badblocks(ns, nsmtd);
 	if (ret)
 		goto free_ns_object;
+	ret = nand_set_release(chip, ns_chip_release);
+	if (ret)
+		goto free_ns_object;
+	retained = true;
 
 	/* Register NAND partitions */
 	ret = mtd_device_register(nsmtd, &ns->partitions[0], ns->nbparts);
@@ -2391,11 +2401,16 @@ static int __init ns_init_module(void)
 unregister_mtd:
 	WARN_ON(mtd_device_unregister(nsmtd));
 free_ns_object:
+	if (retained)
+		nand_disconnect(chip);
 	ns_free(ns);
 free_ebw:
 	kfree(erase_block_wear);
 cleanup_nand:
-	nand_cleanup(chip);
+	if (retained)
+		mtd_put_master(nsmtd);
+	else
+		nand_cleanup(chip);
 free_gp_list:
 	list_for_each_safe(pos, n, &grave_pages) {
 		list_del(pos);
@@ -2412,7 +2427,8 @@ static int __init ns_init_module(void)
 		kfree(list_entry(pos, struct weak_block, list));
 	}
 free_ns_struct:
-	kfree(ns);
+	if (!retained)
+		kfree(ns);
 
 	return ret;
 }
@@ -2430,9 +2446,9 @@ static void __exit ns_cleanup_module(void)
 
 	ns_debugfs_remove(ns);
 	WARN_ON(mtd_device_unregister(nsmtd));
+	nand_disconnect(chip);
 	ns_free(ns);
 	kfree(erase_block_wear);
-	nand_cleanup(chip);
 
 	list_for_each_safe(pos, n, &grave_pages) {
 		list_del(pos);
@@ -2449,7 +2465,7 @@ static void __exit ns_cleanup_module(void)
 		kfree(list_entry(pos, struct weak_block, list));
 	}
 
-	kfree(ns);
+	mtd_put_master(nsmtd);
 }
 
 module_exit(ns_cleanup_module);

-- 
2.53.0

