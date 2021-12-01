--
-- Structure de la table `users`
--


ALTER TABLE `users` ADD  `foltonecoin` int(11) NOT NULL DEFAULT 0;
ALTER TABLE `users` ADD  `boutique_id` int(11) NOT NULL;


--
-- Index pour la table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`boutique_id`),
  ADD UNIQUE KEY `identifier` (`identifier`);

--
-- AUTO_INCREMENT pour les tables déchargées
--

--
-- AUTO_INCREMENT pour la table `users`
--
ALTER TABLE `users`
  MODIFY `boutique_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;