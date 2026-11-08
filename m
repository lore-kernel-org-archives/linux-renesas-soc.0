Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.72
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794117624;
	b=y91EcMlZyB4miauI6XmMa1Wj6VdB3/TV5LBaq0cv80wTbJFfOfv5lM29zBhDzEGYeymp
	 Vdj6Ud+A9fIdlOC1xlYpoF6aaWkmS/xE70tL7Nb9s0q2aUKhQsWKImX26YVs/0y5p/6ly
	 gHxY+d0N8c0yu4yXkdqvHtQ0bzUevd43kh9601q8x1WR9TGaiNIOK+0JpQnOkC1x5YhqE
	 +3rFQ2Z51nD2PFCVuFgyETsJEk2ABiiX8N/KgQJbmneF24p9WwBfOnTGE+p/jkf0jo1pX
	 R0Jy2nAyjrR6KA7Yqo9VEs20fyM6Ko1zIcismWsdqVifmwZf2/z5RMbOAp0ekOiPJsg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794117624;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:In-Reply-To:
	 Mime-Version:References:X-Mailer:Message-ID:Subject:From:To:Cc:
	 Content-Type;
	bh=gFMZKE8rB1qHEs9YGj4+e/8ZQgkxp9yc4uMWlT943Dk=;
	b=Bln6lTre0GZhjZS9UrivUvK9HUmSR9v06L3HAfrkGjWgiJ7jbmvfgZ9eH+B0PI+PgctY
	 5BeNwaXeBAm0IkW9R2S13oR8CR4/4w7Bb6oB7HG+Ru6ct4DPEL8+Dcmm0U6JYsXe3hW2p
	 WuIsD+AG4FY7/IRanOy5LuJt4dXvTT+uCKZK0Hc74EQfo+L2uZ3IFj1KV0OF+Y5j4RTPw
	 Y2/yp2S1Mel0cmM+h8tj38sCMZIwCqJ7u4DWOVZgpwZHoj0xGcyBh8jdQx8K+KlNkJq//
	 zsQiwBUSra+gf406XZJO2yyTtRSGQBPa8A4CeGhP9UhmOZ2+FbHDFXi5dw/DKdVupeA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--almasrymina.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=oM1ut0Jl;
	arc=none smtp.remote-ip=74.125.82.72
Received: from mail-dl1-f72.google.com (mail-dl1-f72.google.com [74.125.82.72])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B1A40606EE98
	for <linux-renesas-soc@vger.kernel.org>; Sun,  8 Nov 2026 06:00:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B1A40606EE98
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--almasrymina.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=oM1ut0Jl
Received: by mail-dl1-f72.google.com with SMTP id a92af1059eb24-1aa0fb7f157so277649c88.0
        for <linux-renesas-soc@vger.kernel.org>; Sat, 07 Nov 2026 22:00:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1794117623; x=1794722423; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=gFMZKE8rB1qHEs9YGj4+e/8ZQgkxp9yc4uMWlT943Dk=;
        b=oM1ut0JlHy5QzoA3UcW9p1p1fGsiJbScpQkXNdjQOafFHv+idXGAGLXjf3FqNn+1B0
         8hGy/QM5LQJIhtsz9yZWoQvj8heLc++gOZiLRJ/VGNDbRYx4eqxgyQhXllmam6PjeuPk
         6LY4BJ12ZI0wgZ1zRvvuxla2MINsu4MQy6eLgtvMlx3TTJWwV9iplAfOitVcdvr2cFbM
         jqz8XNFBduB3sfTJ74NJt+wA4iblcr5NCEJaWQG6LGcBlo2tv3V+WMmKtulXqrUydCYh
         6/ZrIpybAd8rwbmTkGNueHFhIZYlk+CHQQw4FnrwV9BCi0r6gHHmjHVC7FiGRC4SP4S8
         DrlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794117623; x=1794722423;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=gFMZKE8rB1qHEs9YGj4+e/8ZQgkxp9yc4uMWlT943Dk=;
        b=B7TYAbmwLMug9oRvAQrvBY7EJCw+guqWkIBzx7S2OlpMIFoY4irhY+7h6veWUBmwvO
         y/+NVYBEZQ0Eo2l75Nh48UrAYPxEQpnh+7wm8XfzSVIsx/7sUIOsDQWpp0RxZlMBIqdx
         5eaSLZPI3RIPyiEzU9Z+VQKHtJ006uBXMTclf2QqEvLFOHgJilBecWc6d2V3ALqjX+Mo
         4zE9doB7GNBVLLDCF0ehqOKVJIAc5Kue54OBtjB7unAIkNOOJjguM6tbf1+tgVE+PBrM
         SKMNiABUA43rPSyd8q9DO6O6Osui3KXcnAn97wQLKIPF56Z9NbccNayLKg9JGRF/Cqj6
         Udlw==
X-Forwarded-Encrypted: i=1; AKwUvBxt2gT+utakeDlpewvkvqwid24642+ElHPE4jej5o/69rOIe8YdNqLmffTVs8/JxCpbIaP9CCGOTo/LbTXPyWKoHw==@vger.kernel.org
X-Gm-Message-State: APuU4Z++MukIgv5Mtmz905SC/ca4BCdPihgMUObuqw5NIG9Ke7K3XCxu
	Yyauk13DbaptkhFHxlAB0Fzj2HKnz5TAy1ZTm7iK/zajj4lYHkie3iko9588hpVREbiQgSeUMrJ
	BPQzYeJq+oZSCXZ4wXeVOWfUo5Q==
X-Received: from dlev11.prod.google.com ([2002:a05:701b:464b:b0:189:931c:18ef])
 (user=almasrymina job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:7022:e02:b0:191:3c:aae7 with SMTP id a92af1059eb24-1b39feec174mr1478394c88.26.1794117620448;
 Sat, 07 Nov 2026 22:00:20 -0800 (PST)
Date: Sun,  8 Nov 2026 06:00:13 +0000
In-Reply-To: <20261108060016.2131509-1-almasrymina@google.com>
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Post: <mailto:linux-renesas-soc@vger.kernel.org>
List-Help: <mailto:linux-renesas-soc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-renesas-soc+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
References: <20261108060016.2131509-1-almasrymina@google.com>
X-Mailer: git-send-email 2.56.0.455.g6c5a503b38-goog
Message-ID: <20261108060016.2131509-3-almasrymina@google.com>
Subject: [PATCH net-next v2 2/5] net: skbuff: refcount spliced page_pool frags
 via skb_pipe_buf_ops
From: Mina Almasry <almasrymina@google.com>
To: netdev@vger.kernel.org
Cc: Mina Almasry <almasrymina@google.com>, Jesper Dangaard Brouer <hawk@kernel.org>, 
	Ilias Apalodimas <ilias.apalodimas@linaro.org>, "David S. Miller" <davem@davemloft.net>, 
	Eric Dumazet <edumazet@kernel.org>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	Simon Horman <horms@kernel.org>, Neal Cardwell <ncardwell@google.com>, 
	Kuniyuki Iwashima <kuniyu@google.com>, Pavel Begunkov <asml.silence@gmail.com>, 
	Bobby Eshleman <bobbyeshleman@meta.com>, Stanislav Fomichev <sdf@fomichev.me>, linux-kernel@vger.kernel.org, 
	Steffen Klassert <steffen.klassert@secunet.com>, Herbert Xu <herbert@gondor.apana.org.au>, 
	Willem de Bruijn <willemb@google.com>, John Fastabend <john.fastabend@gmail.com>, 
	Sabrina Dubroca <sd@queasysnail.net>, Andrew Lunn <andrew+netdev@lunn.ch>, 
	"Michael S. Tsirkin" <mst@redhat.com>, Jason Wang <jasowangio@gmail.com>, 
	"=?UTF-8?q?Eugenio=20P=C3=A9rez?=" <eperezma@redhat.com>, Xuan Zhuo <xuanzhuo@linux.alibaba.com>, 
	Andrew Morton <akpm@linux-foundation.org>, David Hildenbrand <david@kernel.org>, 
	Lorenzo Stoakes <ljs@kernel.org>, "Liam R. Howlett" <liam@infradead.org>, Vlastimil Babka <vbabka@kernel.org>, 
	Mike Rapoport <rppt@kernel.org>, Suren Baghdasaryan <surenb@google.com>, Michal Hocko <mhocko@suse.com>, 
	Alexei Starovoitov <ast@kernel.org>, Daniel Borkmann <daniel@iogearbox.net>, 
	Johannes Berg <johannes@sipsolutions.net>, Byungchul Park <byungchul@sk.com>, Zi Yan <ziy@nvidia.com>, 
	virtualization@lists.linux.dev, linux-mm@kvack.org, bpf@vger.kernel.org, 
	linux-wireless@vger.kernel.org, Jonathan Corbet <corbet@lwn.net>, 
	Shuah Khan <skhan@linuxfoundation.org>, Randy Dunlap <rdunlap@infradead.org>, 
	Lorenzo Bianconi <lorenzo@kernel.org>, Wen Gu <guwen@linux.alibaba.com>, 
	Philo Lu <lulie@linux.alibaba.com>, Justin Chen <justin.chen@broadcom.com>, 
	Florian Fainelli <florian.fainelli@broadcom.com>, Vikas Gupta <vikas.gupta@broadcom.com>, 
	Michael Chan <michael.chan@broadcom.com>, Pavan Chebbi <pavan.chebbi@broadcom.com>, 
	Doug Berger <opendmb@gmail.com>, Nicolai Buchwitz <nb@tipi-net.de>, 
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, Satish Kharat <satishkh@cisco.com>, 
	Wei Fang <wei.fang@nxp.com>, Frank Li <frank.li@nxp.com>, Shenwei Wang <shenwei.wang@nxp.com>, 
	Joshua Washington <joshwash@google.com>, Harshitha Ramamurthy <hramamurthy@google.com>, 
	Jijie Shao <shaojijie@huawei.com>, Jian Shen <shenjian15@huawei.com>, 
	Fan Gong <gongfan1@huawei.com>, Tony Nguyen <anthony.l.nguyen@intel.com>, 
	Przemek Kitszel <przemyslaw.kitszel@intel.com>, Marcin Wojtas <marcin.s.wojtas@gmail.com>, 
	Russell King <linux@armlinux.org.uk>, Sunil Goutham <sgoutham@marvell.com>, 
	Geetha sowjanya <gakula@marvell.com>, Ratheesh Kannoth <rkannoth@marvell.com>, 
	Subbaraya Sundeep <sbhatta@marvell.com>, Bharat Bhushan <bbhushan2@marvell.com>, 
	Felix Fietkau <nbd@nbd.name>, Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Tariq Toukan <tariqt@nvidia.com>, 
	Saeed Mahameed <saeedm@nvidia.com>, Mark Bloch <mbloch@nvidia.com>, Leon Romanovsky <leon@kernel.org>, 
	Ido Schimmel <idosch@nvidia.com>, Petr Machata <petrm@nvidia.com>, 
	Horatiu Vultur <horatiu.vultur@microchip.com>, UNGLinuxDriver@microchip.com, 
	Daniel Machon <daniel.machon@microchip.com>, Steen Hegelund <Steen.Hegelund@microchip.com>, 
	Haiyang Zhang <haiyangz@microsoft.com>, Wei Liu <wei.liu@kernel.org>, 
	Dexuan Cui <decui@microsoft.com>, Yibo Dong <dong100@mucse.com>, 
	Brett Creeley <brett.creeley@amd.com>, Justin Lai <justinlai0215@realtek.com>, 
	Larry Chiu <larry.chiu@realtek.com>, 
	"=?UTF-8?q?Niklas=20S=C3=B6derlund?=" <niklas.soderlund@ragnatech.se>, Paul Barker <paul@pbarker.dev>, 
	Masahisa Kojima <kojima.masahisa@socionext.com>, 
	Maxime Chevallier <maxime.chevallier@bootlin.com>, Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
	Alexandre Torgue <alexandre.torgue@foss.st.com>, FUJITA Tomonori <fujita.tomonori@gmail.com>, 
	Siddharth Vadapalli <s-vadapalli@ti.com>, Roger Quadros <rogerq@kernel.org>, 
	MD Danish Anwar <danishanwar@ti.com>, Jiawen Wu <jiawenwu@trustnetic.com>, 
	Mengyuan Lou <mengyuanlou@net-swift.com>, Ronak Doshi <ronak.doshi@broadcom.com>, 
	Ryder Lee <ryder.lee@mediatek.com>, Shayne Chen <shayne.chen@mediatek.com>, 
	Sean Wang <sean.wang@mediatek.com>, Juergen Gross <jgross@suse.com>, 
	Stefano Stabellini <sstabellini@kernel.org>, 
	Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>, Jordan Rhee <jordanrhee@google.com>, 
	Ankit Garg <nktgrg@google.com>, Tim Hostetler <thostet@google.com>, 
	Eric Joyner <eric.joyner@amd.com>, Prabu Thayalan <prabu.ponrajthayalan@amd.com>, 
	"Nikhil P. Rao" <nikhil.rao@amd.com>, Chintan Vankar <c-vankar@ti.com>, 
	Nora Schiffer <nora.schiffer@ew.tq-group.com>, Alexander Sverdlin <alex@sverdlin.org>, 
	Kevin Hao <haokexin@gmail.com>, Karl Mehltretter <kmehltretter@gmail.com>, 
	Aleksandr Loktionov <aleksandr.loktionov@intel.com>, Meghana Malladi <m-malladi@ti.com>, 
	Jacob Keller <jacob.e.keller@intel.com>, StanleyYP Wang <StanleyYP.Wang@mediatek.com>, 
	linux-doc@vger.kernel.org, imx@lists.linux.dev, linux-rdma@vger.kernel.org, 
	linux-hyperv@vger.kernel.org, linux-renesas-soc@vger.kernel.org, 
	linux-omap@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Update skb_splice_bits() (spd_fill_page(), sock_spd_release(), and
skb_pipe_buf_ops) and skb_append_pagefrags() to acquire and release
references via netmem_inc_ref(), netmem_dec_ref(), and skb_frag_ref()
so page_pool RX fragments spliced into a pipe remain pinned in the pool
while in the pipe and pair with skb_append_pagefrags() and
skb_release_data() when spliced into a TX socket once netmem_inc_ref()
and netmem_dec_ref() handle page_pool netmems.

In tls_push_data(), fall back to copying when MSG_SPLICE_PAGES
encounters a page_pool page because kTLS device offload record->frags[]
tracks pages via raw struct page references rather than pp_ref_count
before handing them to tls_push_sg().

Caveats:
- Because pipe buffers created by skb_splice_bits() hold pp_ref_count
  until released (including across tee()), user pipes holding
  unconsumed spliced data keep those page_pool pages in-flight and
  DMA-mapped in the pool (bounded by pipe capacity and RLIMIT_NOFILE
  rather than sk_rcvbuf) until the pipe buffers are consumed or closed,
  with page_pool_destroy() deferring pool release via its periodic
  workqueue and page_pool_scrub() unmapping DMA.

Signed-off-by: Mina Almasry <almasrymina@google.com>
---
 net/core/skbuff.c    | 31 +++++++++++++++++++++++++++----
 net/tls/tls_device.c |  6 ++++++
 2 files changed, 33 insertions(+), 4 deletions(-)

diff --git a/net/core/skbuff.c b/net/core/skbuff.c
index 48f6764117243..19d4ce347c41b 100644
--- a/net/core/skbuff.c
+++ b/net/core/skbuff.c
@@ -3114,9 +3114,32 @@ EXPORT_SYMBOL(skb_copy_bits);
  */
 static void sock_spd_release(struct splice_pipe_desc *spd, unsigned int i)
 {
-	put_page(spd->pages[i]);
+	netmem_dec_ref(page_to_netmem(spd->pages[i]));
 }
 
+static void skb_pipe_buf_release(struct pipe_inode_info *pipe,
+				 struct pipe_buffer *buf)
+{
+	netmem_dec_ref(page_to_netmem(buf->page));
+}
+
+static bool skb_pipe_buf_get(struct pipe_inode_info *pipe,
+			     struct pipe_buffer *buf)
+{
+	struct page *page = compound_head(buf->page);
+
+	if (WARN_ON_ONCE(page_ref_count(page) <= 0))
+		return false;
+
+	netmem_inc_ref(page_to_netmem(page));
+	return true;
+}
+
+static const struct pipe_buf_operations skb_pipe_buf_ops = {
+	.release	= skb_pipe_buf_release,
+	.get		= skb_pipe_buf_get,
+};
+
 static struct page *linear_to_page(struct page *page, unsigned int *len,
 				   unsigned int *offset,
 				   struct sock *sk)
@@ -3165,7 +3188,7 @@ static bool spd_fill_page(struct splice_pipe_desc *spd, struct page *page,
 		spd->partial[spd->nr_pages - 1].len += *len;
 		return false;
 	}
-	get_page(page);
+	netmem_inc_ref(page_to_netmem(page));
 	spd->pages[spd->nr_pages] = page;
 	spd->partial[spd->nr_pages].len = *len;
 	spd->partial[spd->nr_pages].offset = offset;
@@ -3281,7 +3304,7 @@ int skb_splice_bits(struct sk_buff *skb, struct sock *sk, unsigned int offset,
 		.pages = pages,
 		.partial = partial,
 		.nr_pages_max = MAX_SKB_FRAGS,
-		.ops = &nosteal_pipe_buf_ops,
+		.ops = &skb_pipe_buf_ops,
 		.spd_release = sock_spd_release,
 	};
 	int ret = 0;
@@ -4692,8 +4715,8 @@ int skb_append_pagefrags(struct sk_buff *skb, struct page *page,
 		skb_frag_size_add(&skb_shinfo(skb)->frags[i - 1], size);
 	} else if (i < max_frags) {
 		skb_zcopy_downgrade_managed(skb);
-		get_page(page);
 		skb_fill_page_desc_noacc(skb, i, page, offset, size);
+		skb_frag_ref(skb, i);
 	} else {
 		return -EMSGSIZE;
 	}
diff --git a/net/tls/tls_device.c b/net/tls/tls_device.c
index 4cdfbb57ecff0..05abf8e23f78a 100644
--- a/net/tls/tls_device.c
+++ b/net/tls/tls_device.c
@@ -513,10 +513,16 @@ static int tls_push_data(struct sock *sk,
 				goto handle_error;
 			}
 
+			if (page_pool_page_is_pp(compound_head(*pages))) {
+				iov_iter_revert(iter, copy);
+				goto copy_data;
+			}
+
 			zc_pfrag.offset = off;
 			zc_pfrag.size = copy;
 			tls_append_frag(record, &zc_pfrag, copy);
 		} else if (copy) {
+copy_data:
 			copy = min_t(size_t, copy, pfrag->size - pfrag->offset);
 
 			rc = tls_device_copy_data(page_address(pfrag->page) +
-- 
2.56.0.455.g6c5a503b38-goog

