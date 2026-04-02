Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 458173E8681
	for <linux-renesas-soc@vger.kernel.org>; Thu,  2 Apr 2026 12:59:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775134809; cv=none; b=X/l2aNQFkRuWsP6C+s/imvRluI6TCbPig+ODPpbgJsF+/qr+SkPMkj+rjJKZzghgE1HdY+l1I6VgCspuwFQZ87MiES8lqLqk+NnPWiXEtPxN+is9nP3BrVA6wed8qmJE1WeeXSpO1BZTdQtaE4142uUErMu74RZajPj+l7XUqbM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775134809; c=relaxed/simple;
	bh=VUFLpba8GM3GUdpK579WfjWi6mZj1+k4NH7DOxAiBUw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Q3wZsCF1LmkZLCYqKm0td6/o4qJdzB6dM4IkDke8mcavJdE4USd3POTuzhNZIN73SGMs04004m79IZ+l/t/15u/fPrjRoLpny8hnf0WHAj1FjLeX4hEq9X0F5/PvEtjgcmhTLtAbUi0F4nojPJrUp25c7wZmy3thPBkStD4QIwY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=Fg2IsBzg; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="Fg2IsBzg"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1775134797;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=SjwC83queLWEKv6OTzVcZLEYSTeIL3QRJzwCLQmlbvI=;
	b=Fg2IsBzgEkCTuTcUpDxkn0otFXawlr7D0DILB6vCMwNIUnscHYHOBxiNFjV7stBtLKbpfV
	oCWtOR98TpiHpSaVLZDahUMPryxEcBuAv1XW9GKVdLixP/p5LOMPdNipBxFFu/KWk5JSpE
	J8TnOiGYakEmOAJ2n3xW1J2IW2sv0+A=
Received: from mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-220-pWsFiXeHOJiUhzNPhxL4tA-1; Thu,
 02 Apr 2026 08:59:54 -0400
X-MC-Unique: pWsFiXeHOJiUhzNPhxL4tA-1
X-Mimecast-MFC-AGG-ID: pWsFiXeHOJiUhzNPhxL4tA_1775134792
Received: from mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.4])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 42F3B1800359;
	Thu,  2 Apr 2026 12:59:52 +0000 (UTC)
Received: from gerbillo.redhat.com (unknown [10.44.32.195])
	by mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 9069F30002D2;
	Thu,  2 Apr 2026 12:59:48 +0000 (UTC)
From: Paolo Abeni <pabeni@redhat.com>
To: michael.dege@renesas.com
Cc: paul@pbarker.dev,
	niklas.soderlund@ragnatech.se,
	kuba@kernel.org,
	yoshihiro.shimoda.uh@renesas.com,
	netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	edumazet@google.com,
	pabeni@redhat.com,
	linux-renesas-soc@vger.kernel.org,
	andrew+netdev@lunn.ch,
	davem@davemloft.net
Subject: Re: [net-next,v3,13/13] net: renesas: rswitch: add vlan aware switching
Date: Thu,  2 Apr 2026 14:59:46 +0200
Message-ID: <20260402125946.234499-1-pabeni@redhat.com>
In-Reply-To: <20260331-rswitch_add_vlans-v3-13-c37f41b1c556@renesas.com>
References: <20260331-rswitch_add_vlans-v3-13-c37f41b1c556@renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.4

This is an AI-generated review of your patch. The human sending this
email has considered the AI review valid, or at least plausible.

For local reproduction steps see https://netdev-ai.bots.linux.dev/ai-local.html
---
net: renesas: rswitch: add vlan aware switching

This commit adds vlan support to the L2 HW bridge, with limited support
on R-Car S4 (not fully 802.1Q compliant).

> diff --git a/drivers/net/ethernet/renesas/Kconfig b/drivers/net/ethernet/renesas/Kconfig
> index 9b7559c88bee..2494ff60e8c2 100644
> --- a/drivers/net/ethernet/renesas/Kconfig
> +++ b/drivers/net/ethernet/renesas/Kconfig

[ ... ]

> diff --git a/drivers/net/ethernet/renesas/rswitch_l2.c b/drivers/net/ethernet/renesas/rswitch_l2.c
> index ea95a87ed234..b7d0e7f94ecd 100644
> --- a/drivers/net/ethernet/renesas/rswitch_l2.c
> +++ b/drivers/net/ethernet/renesas/rswitch_l2.c

[ ... ]

> @@ -212,61 +197,397 @@ static int rswitch_netdevice_event(struct notifier_block *nb,

[ ... ]

> +static int rswitch_handle_port_obj_add(struct net_device *ndev,
> +				       struct notifier_block *nb,
> +				       struct switchdev_notifier_port_obj_info *info)
> +{
> +	struct switchdev_obj_port_vlan *p_vlan = SWITCHDEV_OBJ_PORT_VLAN(info->obj);
> +	struct rswitch_private *priv;
> +	int err;
> +
> +	priv = container_of(nb, struct rswitch_private, rswitch_switchdev_blocking_nb);
> +
> +	if ((p_vlan->flags & BRIDGE_VLAN_INFO_MASTER) ||
> +	    (p_vlan->flags & BRIDGE_VLAN_INFO_RANGE_BEGIN) ||
> +	    (p_vlan->flags & BRIDGE_VLAN_INFO_RANGE_END) ||
> +	    (p_vlan->flags & BRIDGE_VLAN_INFO_ONLY_OPTS))
> +		return NOTIFY_DONE;
> +
> +	switch (info->obj->id) {
> +	case SWITCHDEV_OBJ_ID_PORT_VLAN:

Can the flag checks access the wrong memory? The code casts info->obj to
switchdev_obj_port_vlan before checking info->obj->id. When the notifier
delivers a non-VLAN object (such as SWITCHDEV_OBJ_ID_PORT_MDB for multicast
group changes), SWITCHDEV_OBJ_PORT_VLAN() performs an incorrect container_of
cast, and p_vlan->flags reads bytes from a different struct type.

For switchdev_obj_port_mdb, the p_vlan->flags field overlaps with the first
2 bytes of the addr[ETH_ALEN] MAC address field. Multicast MAC addresses
always have bit 0 of the first byte set, which matches BRIDGE_VLAN_INFO_MASTER
(1<<0), causing the function to return NOTIFY_DONE instead of falling through
to the default case that returns -EOPNOTSUPP.

Other switchdev drivers (lan966x, mlxsw, cpsw) perform the
SWITCHDEV_OBJ_PORT_VLAN cast inside the SWITCHDEV_OBJ_ID_PORT_VLAN case,
not before the type switch.

The same issue exists in rswitch_handle_port_obj_del().

> +		if (!is_rdev(ndev))
> +			err = rswitch_port_obj_do_add_gwca(ndev, priv, p_vlan);
> +		else
> +			err = rswitch_port_obj_do_add(ndev, p_vlan);
> +
> +		if (err < 0)
> +			return err;
> +
> +		break;
> +	default:
> +		return -EOPNOTSUPP;
> +	}
> +
> +	info->handled = true;
> +
> +	return NOTIFY_DONE;
> +}
> +
> +static int rswitch_handle_port_obj_del(struct net_device *ndev,
> +				       struct notifier_block *nb,
> +				       struct switchdev_notifier_port_obj_info *info)
> +{
> +	struct switchdev_obj_port_vlan *p_vlan = SWITCHDEV_OBJ_PORT_VLAN(info->obj);
> +	struct rswitch_private *priv;
> +	int err;
> +
> +	priv = container_of(nb, struct rswitch_private, rswitch_switchdev_blocking_nb);
> +
> +	if ((p_vlan->flags & BRIDGE_VLAN_INFO_MASTER) ||
> +	    (p_vlan->flags & BRIDGE_VLAN_INFO_RANGE_BEGIN) ||
> +	    (p_vlan->flags & BRIDGE_VLAN_INFO_RANGE_END) ||
> +	    (p_vlan->flags & BRIDGE_VLAN_INFO_ONLY_OPTS))
> +		return NOTIFY_DONE;
> +
> +	switch (info->obj->id) {
> +	case SWITCHDEV_OBJ_ID_PORT_VLAN:
> +		if (!is_rdev(ndev))
> +			err = rswitch_port_obj_do_del_gwca(ndev, priv, p_vlan);
> +		else
> +			err = rswitch_port_obj_do_del(ndev, p_vlan);
> +
> +		if (err < 0)
> +			return err;
> +
> +		break;
> +	default:
> +		return -EOPNOTSUPP;
> +	}
> +
> +	info->handled = true;
> +
> +	return NOTIFY_DONE;
> +}

[ ... ]

