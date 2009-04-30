/* 20090429 GM指令等級限制更改 */
Update commands Set access_level = '50' Where name = 'invisible'; /* 隱身 */
Update commands Set access_level = '50' Where name = 'visible'; /* 解除隱身 */
Update commands Set access_level = '50' Where name = 'help'; /* 指令輔助說明 */
Update commands Set access_level = '50' Where name = 'topc'; /* 移動到角色座標 */
Update commands Set access_level = '50' Where name = 'move'; /* 移動到地圖座標 */
Update commands Set access_level = '50' Where name = 'kick'; /* 踢除角色 */
Update commands Set access_level = '50' Where name = 'chat'; /* 解除禁言 */
Update commands Set access_level = '50' Where name = 'chatng'; /* 禁言 */
Update commands Set access_level = '50' Where name = 'hpbar'; /* 怪物血條顯示 */
Update commands Set access_level = '50' Where name = 'speed'; /* 加速 */
Update commands Set access_level = '50' Where name = 'loc'; /* 目前地圖編號與座標顯示 */
Update commands Set access_level = '50' Where name = 'f'; /* 標記地點 */
Update commands Set access_level = '50' Where name = 'gmroom'; /* GM房移動 */
Update commands Set access_level = '50' Where name = 'patrol'; /* 線上角色列表視窗 */
Update commands Set access_level = '100' Where name = 'recall'; /* 招喚角色 */
Update commands Set access_level = '100' Where name = 'partyrecall'; /* 招換全部玩家 */
Update commands Set access_level = '100' Where name = 'who'; /* 線上玩家列表 */
Update commands Set access_level = '100' Where name = 'spawn'; /* 招喚NPC */
Update commands Set access_level = '100' Where name = 'ress'; /* 復活玩家 */
Update commands Set access_level = '100' Where name = 'buff'; /* 施展單一附加技能(全體/個人) */
Update commands Set access_level = '150' Where name = 'item'; /* 道具產生 */
Update commands Set access_level = '150' Where name = 'powerkick'; /* 踢除角色並封鎖 */
Update commands Set access_level = '150' Where name = 'accbankick'; /* 帳號封鎖 */
Update commands Set access_level = '150' Where name = 'banip'; /* 封鎖IP */
Update commands Set access_level = '150' Where name = 'summon'; /* 招喚NPC寵物 */
Update commands Set access_level = '150' Where name = 'level'; /* 等級設定 */
Update commands Set access_level = '150' Where name = 'adena'; /* 金幣產生 */
Update commands Set access_level = '150' Where name = 'itemset'; /* 道具設定 */
Update commands Set access_level = '150' Where name = 'poly'; /* 變身 */
Update commands Set access_level = '150' Where name = 'weather'; /* 天氣控制 */
Update commands Set access_level = '150' Where name = 'hometown'; /* 村莊日&月處理(稅率) */
